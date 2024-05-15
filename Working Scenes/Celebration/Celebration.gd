extends RigidBody3D

@onready var right: GPUParticles3D = $right
@onready var centre: GPUParticles3D = $centre
@onready var left: GPUParticles3D = $left


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	
	if "Player" in body.get_groups():
		right.emitting = true
		left.emitting = true
		centre.emitting = true
