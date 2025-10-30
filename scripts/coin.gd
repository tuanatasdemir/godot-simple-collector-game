extends Area2D

var is_collected = false
@onready var collect_sound = $CollectSound
@onready var sprite = $Sprite2D  
@onready var collision = $CollisionShape2D 

signal coin_collected

func _on_body_entered(body):
	if is_collected:
		return
		
	if body.has_method("move_and_slide"):
		is_collected = true
		coin_collected.emit()
		collect_sound.play()
		sprite.hide()

		collision.set_deferred("disabled",true)
		await collect_sound.finished
		queue_free()
