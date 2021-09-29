extends KinematicBody
class_name Ball


var _velocity := Vector3.ZERO

func _physics_process(delta):
	var collision = self.move_and_collide(_velocity, true)
	if collision:
		#print(collision)
		_velocity += collision.normal * 10.0


	_velocity.y -= 9.8 * delta
