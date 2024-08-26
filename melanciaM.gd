extends Area2D

@onready var player = Global.player

signal morreu
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		Global.dano = 2
		print("Levou dano?")
		player._levouDano()
	
	pass # Replace with function body.


func _on_body_exited(body):
	Global.dano = 1
