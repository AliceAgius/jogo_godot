extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		print("coletado")
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free()
