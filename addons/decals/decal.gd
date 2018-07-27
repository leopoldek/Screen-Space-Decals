tool
extends MeshInstance

const SHADER = preload("decal.shader")

export(Texture) var decal setget set_decal
export(Vector2) var uv_offset = Vector2() setget set_uv_offset
export(Vector2) var uv_scale = Vector2(1, 1) setget set_uv_scale
export(bool) var emulate_lighting = true setget set_emulate_lighting
export(float, -100.0, 100.0) var brightness = 0.0 setget set_brightness

func _init():
	mesh = CubeMesh.new()
	mesh.material = ShaderMaterial.new()
	mesh.material.shader = SHADER

func set_decal(new_decal):
	decal = new_decal
	mesh.material.set_shader_param("decal", decal)

func set_uv_offset(new_offset):
	uv_offset = new_offset
	mesh.material.set_shader_param("offset", uv_offset)

func set_uv_scale(new_scale):
	uv_scale = new_scale
	mesh.material.set_shader_param("scale", uv_scale)

func set_emulate_lighting(new_value):
	emulate_lighting = new_value
	mesh.material.set_shader_param("emulate_lighting", emulate_lighting)

func set_brightness(new_brightness):
	brightness = new_brightness
	mesh.material.set_shader_param("brightness", brightness * 0.01)