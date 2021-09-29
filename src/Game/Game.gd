extends Spatial

export var ball_multiplier = 5.0
onready var _ball_instancer := preload("res://src/Ball/Ball.tscn")
var _rng : RandomNumberGenerator
var _ball_count := 0

func _ready() -> void:
	# Setup random number generator
	_rng = RandomNumberGenerator.new()
	_rng.randomize()

func _physics_process(delta):
	if Input.is_action_pressed("Jump"):
		for n in ball_multiplier:
			var ball = _ball_instancer.instance()
			self.add_child(ball)
			ball.transform.origin.y = _rng.randf_range(5.0, 15.0)
			ball.transform.origin.x = _rng.randf_range(-100.0, 100.0)
			ball.transform.origin.z = _rng.randf_range(-100, 100.0)
			_ball_count += 1


func _on_FPSTimer_timeout():
	var fps = Engine.get_frames_per_second()
	var title = "FPS: %s | Ball Multiplier: %s | Ball Count: %s" % [fps, ball_multiplier, _ball_count]
	$FPS.text = title
