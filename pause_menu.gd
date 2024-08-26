extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_pause_pressed():
	get_tree().paused = false
	visible = false

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://world.tscn")
	visible = false

func _on_quit_pressed():
	get_tree().quit()

func _on_voltar_pressed():
	pass # Replace with function body.
	get_tree().paused = false
	visible = false 
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"): #esc
		visible = true 
		get_tree().paused = true


