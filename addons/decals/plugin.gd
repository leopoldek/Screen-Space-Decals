tool
extends EditorPlugin

func _enter_tree():
	name = "DecalPlugin"
	add_custom_type("Decal", "MeshInstance", preload("decal.gd"), preload("icon_decal.svg"))
	print("Decal plugin loaded successfully.")

func _exit_tree():
	remove_custom_type("Decal")
	print("Decal plugin unloaded.")