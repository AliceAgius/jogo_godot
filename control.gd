extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://level_2.tscn")
	self.visible = false

func _on_quit_pressed():
	get_tree().quit()

func game_over():
	get_tree().change_scene_to_file("res://gameover.tscn")
	self.visible = false
