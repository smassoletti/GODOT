extends Node3D

func toggle_outline(value: bool) -> void:
	var mesh_instance = $MeshInstance3D
	
	# Loop through all materials attached to the MeshInstance
	for i in range(mesh_instance.get_surface_override_material_count()):
		var material = mesh_instance.get_surface_override_material(i)
		if material == null:
			continue
		
		# Check if the material has a next_pass
		if material.next_pass != null:
			# Set the "enable" shader parameter
			material.next_pass.set_shader_parameter("enable", value)

# NOTICE: This method assumes that all next_passes are the Outline Shader.
# If you have a next_pass attached to a material which is used by the MeshInstance
# and it doesn't have the shader parameter "enable", this might cause an error.
# This is a rare case but should not be underestimated.
