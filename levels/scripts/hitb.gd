extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.velocity.y = body.JUMP_FORCE
		Globals.score += 100
		owner.queue_free()
