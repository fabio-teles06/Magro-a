extends Node3D

@onready var mesh_instance: MeshInstance3D = $MeshInstance


func _ready() -> void:
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)

	# Set up arrays for a simple cube mesh
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()

	# Define the 8 vertices of a cube
	vertices.push_back(Vector3(-1, -1, -1))
	vertices.push_back(Vector3(1, -1, -1))
	vertices.push_back(Vector3(1, 1, -1))
	vertices.push_back(Vector3(-1, 1, -1))
	vertices.push_back(Vector3(-1, -1, 1))
	vertices.push_back(Vector3(1, -1, 1))
	vertices.push_back(Vector3(1, 1, 1))
	vertices.push_back(Vector3(-1, 1, 1))

	# Nova definição de índices (anti-horário visto de fora)
	indices.push_back(0); indices.push_back(3); indices.push_back(2) # Traseira (Tri 1)
	indices.push_back(2); indices.push_back(1); indices.push_back(0) # Traseira (Tri 2)
	
	indices.push_back(4); indices.push_back(5); indices.push_back(6) # Frontal (Tri 1)
	indices.push_back(6); indices.push_back(7); indices.push_back(4) # Frontal (Tri 2)

	indices.push_back(4); indices.push_back(7); indices.push_back(3) # Esquerda (Tri 1)
	indices.push_back(3); indices.push_back(0); indices.push_back(4) # Esquerda (Tri 2)
	
	indices.push_back(1); indices.push_back(2); indices.push_back(6) # Direita (Tri 1)
	indices.push_back(6); indices.push_back(5); indices.push_back(1) # Direita (Tri 2)
	
	indices.push_back(3); indices.push_back(7); indices.push_back(6) # Superior (Tri 1)
	indices.push_back(6); indices.push_back(2); indices.push_back(3) # Superior (Tri 2)
	
	indices.push_back(0); indices.push_back(1); indices.push_back(5) # Inferior (Tri 1)
	indices.push_back(5); indices.push_back(4); indices.push_back(0) # Inferior (Tri 2)

	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices

	var mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	mesh_instance.mesh = mesh
	pass
