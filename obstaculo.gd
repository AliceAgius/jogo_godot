extends Area2D

@onready var player = Global.player
func _on_body_entered(body):
	if body.name == "player":
		print("Levou dano?")
		player._levouDano()
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
#func _on_body_entered(body):
	#get_tree().reload_current_scene()
	#pass # Replace with function body.




	
	
