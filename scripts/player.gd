extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var speed: float = 200.0
var screen_size: Vector2

func _ready():
	screen_size = get_viewport_rect().size
func _physics_process(_delta):
	
	var direction = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	if direction:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if velocity.y < 0:
			anim.play("kitty_up")
		elif  velocity.y > 0:
			anim.play("kitty_down")
		elif velocity.x < 0:
			anim.play("kitty_left")
		elif velocity.x > 0:
			anim.play("kitty_right")
	else:
		anim.play("kitty")

	move_and_slide()
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
