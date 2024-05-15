extends AnimatableBody3D

@export var destination: Vector3 = Vector3(3.0,0.0,0.0)
@export var duration: float = 2.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var tween = create_tween()
	tween.set_trans(tween.TRANS_SINE)
	tween.set_loops()
	tween.tween_property(self, "global_position", global_position + destination, duration)
	tween.tween_property(self, "global_position", global_position - destination, duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
