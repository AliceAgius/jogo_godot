extends Node2D

var please_reset = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.pontos = 1
	Global.player.reset.connect(reset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if please_reset:
		get_tree().change_scene_to_file("res://gameover.tscn")
		
		

func reset():
	please_reset = true


func _on_area_2d_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://gameover.tscn")
