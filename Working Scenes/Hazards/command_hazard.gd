extends RigidBody3D

@export_range(0,1000) var thrust: float = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("Forward"):
		apply_central_force(Vector3(0.0,0.0,-thrust * delta))
		
	if Input.is_action_pressed("Backward"):
		apply_central_force(Vector3(0.0,0.0,thrust * delta))
		
	if Input.is_action_pressed("Right"):
		apply_central_force(Vector3(thrust * delta,0.0,0.0))
		
	if Input.is_action_pressed("Left"):
		apply_central_force(Vector3(-thrust * delta,0.0,0.0))
