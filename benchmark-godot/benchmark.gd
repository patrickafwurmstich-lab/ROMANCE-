extends Node3D
## Benchmark da clareira de Néria (128 x 128 m).
## Mede FPS médio e 1% low com: terreno, árvores, NPCs andando e câmera girando.
## Teclas: 1/2/3 = 50/100/200 árvores | N = +1 NPC | S = sombras on/off | R = reinicia a medição

@export var tree_count := 100
@export var npc_count := 6
@export var measure_seconds := 30.0
## Para testar com VRM de verdade: instale o addon "godot-vrm" (V-Sekai) pela AssetLib,
## importe o .vrm e arraste a cena dele para cá. Vazio = usa cápsulas no lugar.
@export var npc_scene: PackedScene

var _frame_times: Array[float] = []
var _elapsed := 0.0
var _label: Label
var _sun: DirectionalLight3D
var _cam_pivot: Node3D
var _npcs: Array[Node3D] = []
var _trees_root: Node3D
var _report_done := false

func _ready() -> void:
	_build_environment()
	_build_ground()
	_trees_root = Node3D.new()
	add_child(_trees_root)
	_spawn_trees(tree_count)
	for i in npc_count:
		_spawn_npc()
	_build_camera()
	_build_hud()

func _build_environment() -> void:
	var env := WorldEnvironment.new()
	var e := Environment.new()
	e.background_mode = Environment.BG_SKY
	e.sky = Sky.new()
	e.sky.sky_material = ProceduralSkyMaterial.new()
	e.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
	env.environment = e
	add_child(env)
	_sun = DirectionalLight3D.new()
	_sun.rotation_degrees = Vector3(-50, 30, 0)
	_sun.shadow_enabled = false
	_sun.directional_shadow_max_distance = 30.0
	add_child(_sun)

func _build_ground() -> void:
	var mi := MeshInstance3D.new()
	var plane := PlaneMesh.new()
	plane.size = Vector2(128, 128)
	plane.subdivide_width = 32
	plane.subdivide_depth = 32
	mi.mesh = plane
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.32, 0.45, 0.22)
	mi.material_override = mat
	add_child(mi)
	# rio simples
	var river := MeshInstance3D.new()
	var rp := PlaneMesh.new()
	rp.size = Vector2(6, 128)
	river.mesh = rp
	river.position = Vector3(30, 0.02, 0)
	var rm := StandardMaterial3D.new()
	rm.albedo_color = Color(0.2, 0.4, 0.6)
	river.material_override = rm
	add_child(river)

func _spawn_trees(n: int) -> void:
	for c in _trees_root.get_children():
		c.queue_free()
	var trunk_mesh := CylinderMesh.new()
	trunk_mesh.top_radius = 0.25
	trunk_mesh.bottom_radius = 0.35
	trunk_mesh.height = 3.0
	trunk_mesh.radial_segments = 8
	var crown_mesh := SphereMesh.new()
	crown_mesh.radius = 1.8
	crown_mesh.height = 3.0
	crown_mesh.radial_segments = 10
	crown_mesh.rings = 6
	var trunk_mat := StandardMaterial3D.new()
	trunk_mat.albedo_color = Color(0.35, 0.24, 0.15)
	var crown_mat := StandardMaterial3D.new()
	crown_mat.albedo_color = Color(0.15, 0.4, 0.18)
	var rng := RandomNumberGenerator.new()
	rng.seed = 2026
	for i in n:
		var t := Node3D.new()
		t.position = Vector3(rng.randf_range(-62, 62), 0, rng.randf_range(-62, 62))
		var trunk := MeshInstance3D.new()
		trunk.mesh = trunk_mesh
		trunk.material_override = trunk_mat
		trunk.position.y = 1.5
		var crown := MeshInstance3D.new()
		crown.mesh = crown_mesh
		crown.material_override = crown_mat
		crown.position.y = 4.0
		# LOD simples: some a partir de 60 m
		trunk.visibility_range_end = 60.0
		crown.visibility_range_end = 60.0
		t.add_child(trunk)
		t.add_child(crown)
		_trees_root.add_child(t)
	tree_count = n

func _spawn_npc() -> void:
	var npc: Node3D
	if npc_scene:
		npc = npc_scene.instantiate()
	else:
		npc = MeshInstance3D.new()
		var cap := CapsuleMesh.new()
		cap.radius = 0.35
		cap.height = 1.7
		(npc as MeshInstance3D).mesh = cap
	npc.position = Vector3(randf_range(-20, 20), 0.85 if npc_scene == null else 0.0, randf_range(-20, 20))
	npc.set_meta("target", _random_point())
	add_child(npc)
	_npcs.append(npc)

func _random_point() -> Vector3:
	return Vector3(randf_range(-40, 40), 0, randf_range(-40, 40))

func _build_camera() -> void:
	_cam_pivot = Node3D.new()
	add_child(_cam_pivot)
	var cam := Camera3D.new()
	cam.position = Vector3(0, 8, 14)
	cam.rotation_degrees = Vector3(-25, 0, 0)
	cam.far = 120.0
	_cam_pivot.add_child(cam)

func _build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)
	_label = Label.new()
	_label.position = Vector2(12, 12)
	_label.add_theme_font_size_override("font_size", 18)
	layer.add_child(_label)

func _process(delta: float) -> void:
	_cam_pivot.rotate_y(delta * 0.3)
	for npc in _npcs:
		var target: Vector3 = npc.get_meta("target")
		var flat := Vector3(npc.position.x, 0, npc.position.z)
		var dir := target - flat
		if dir.length() < 0.5:
			npc.set_meta("target", _random_point())
		else:
			var step := dir.normalized() * 1.4 * delta
			npc.position += step
			npc.look_at(npc.position + step, Vector3.UP)
	_frame_times.append(delta)
	_elapsed += delta
	var fps := Engine.get_frames_per_second()
	var mem := Performance.get_monitor(Performance.MEMORY_STATIC) / 1048576.0
	var draws := Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
	_label.text = "FPS: %d | árvores: %d | NPCs: %d | sombras: %s\nDraw calls: %d | RAM (static): %.0f MB\nMedindo: %.0f / %.0f s\n[1/2/3] árvores  [N] +NPC  [S] sombras  [R] reiniciar" % [
		fps, tree_count, _npcs.size(), "on" if _sun.shadow_enabled else "off", draws, mem, minf(_elapsed, measure_seconds), measure_seconds]
	if _elapsed >= measure_seconds and not _report_done:
		_report()

func _report() -> void:
	_report_done = true
	var sorted := _frame_times.duplicate()
	sorted.sort()
	var total := 0.0
	for t in _frame_times:
		total += t
	var avg_fps := _frame_times.size() / total
	var worst_count := maxi(1, int(sorted.size() * 0.01))
	var worst_total := 0.0
	for i in worst_count:
		worst_total += sorted[sorted.size() - 1 - i]
	var low_fps := worst_count / worst_total
	var line := "%s | árvores=%d NPCs=%d sombras=%s | FPS médio=%.1f | 1%% low=%.1f | draw calls=%d\n" % [
		Time.get_datetime_string_from_system(), tree_count, _npcs.size(), _sun.shadow_enabled,
		avg_fps, low_fps, Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)]
	print(line)
	var f := FileAccess.open("user://benchmark.txt", FileAccess.READ_WRITE if FileAccess.file_exists("user://benchmark.txt") else FileAccess.WRITE)
	f.seek_end()
	f.store_string(line)
	f.close()
	_label.text += "\n\nRESULTADO: FPS médio %.1f | 1%% low %.1f (salvo em user://benchmark.txt)" % [avg_fps, low_fps]

func _reset_measure() -> void:
	_frame_times.clear()
	_elapsed = 0.0
	_report_done = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		match event.keycode:
			KEY_1: _spawn_trees(50); _reset_measure()
			KEY_2: _spawn_trees(100); _reset_measure()
			KEY_3: _spawn_trees(200); _reset_measure()
			KEY_N: _spawn_npc(); _reset_measure()
			KEY_S: _sun.shadow_enabled = not _sun.shadow_enabled; _reset_measure()
			KEY_R: _reset_measure()
