extends RigidBody3D

@export_range(0,1000) var thrust: float = 1000
@onready var explosion_particles: GPUParticles3D = $ExplosionParticles
@onready var success_audio: AudioStreamPlayer3D = $Success
@onready var death: AudioStreamPlayer3D = $Death
var is_transitioning: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


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
		
	if Input.is_action_pressed("Jump"):
		apply_central_force(Vector3(0.0, 1000 * delta, 0.0))	


func _on_body_entered(body: Node) -> void:
	
	if is_transitioning == false:
		if "Hazard" in body.get_groups():
			crash()
			
	if is_transitioning == false:
		if "Goal" in body.get_groups():
			success(body.file_path)
	
func crash() -> void:
	set_process(false)
	is_transitioning = true
	death.play()
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(get_tree().reload_current_scene)
	explosion_particles.emitting = true
	
func success(next_level_file: String) -> void:
	print("Succes")
	set_process(false)
	is_transitioning
	success_audio.play()
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(
		get_tree().change_scene_to_file.bind(next_level_file)
	)
