extends CharacterBody2D

class_name Player

const SPEED = 220.0 #velocidade
const JUMP_VELOCITY = -400.0 #gravidade
var actmorte : bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #variável gravity 
signal _morreu
func _ready():
	Global.player = self
	print("vida:", vida)
	
func _physics_process(delta): #função
	# Add the gravity.
	if not is_on_floor(): #se não estiver no chão
		velocity.y += gravity * delta #cair
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor(): #se estiver no chão
		velocity.y = JUMP_VELOCITY #ficar em cima
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right") #variável
	if !actmorte:
		if velocity.x == 0 && actmorte == false:
			%animacao2.play("idle")
		if velocity.y > 0 && actmorte == false:
			%animacao2.play("fall")
		if velocity.y < 0 && actmorte == false:
			%animacao2.play("jump")
	if direction: #se
		if is_on_floor() && actmorte == false:
			%animacao2.play("run")
		velocity.x = direction * SPEED
		if Input.is_action_pressed("ui_right"):
			%animacao2.scale.x = 0.8
		if Input.is_action_pressed("ui_left"):
			%animacao2.scale.x = -0.8
			
		
		
	else: #senão
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
func morte():
	%animacao2.play("mortea")
	actmorte = true
	Global.pontos = 0
	await %animacao2.animation_finished
	emit_signal("reset")

#func _on_melancia_m_morreu():
	


signal reset
	


func _on_morreu():
	print("morreu")
	actmorte = true
	morte()

@export var vida = 3




func _levouDano():
	print ("Sim")
	emit_signal("Morreu")
	var dano = vida - Global.dano
	
	var tween = get_tree().create_tween()
	self.modulate = Color(0.90,0,0.90)
	#tween.tween_interval(1)
	
	tween.tween_property(self, "modulate", Color(1,1,1), 1)
	tween.tween_property(self, "vida", dano, 1)
	print("vida: ", vida)
	
func _process(delta):
	if vida == 0:
		actmorte = true
		morte()
