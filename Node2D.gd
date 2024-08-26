extends Control

@onready var timer_count = $timer_count as Label
@onready var contador_melons = $points as Label
@onready var timer = $timer_cont as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0


@export_range(0,5) var min_padrao := 1
@export_range(0,59) var seg_padrao := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	contador_melons.text = str("%03d" % Global.pontos)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#timer_count.text = str("%02d" % $Timer_cont.time_left)
	#timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	$points.text = str(Global.pontos)
	contador_melons.text = str("%03d" % Global.pontos)
	if minutos == 0 and segundos == 0:
		emit_signal("tempo acabou")
		
		
func _on_timer_cont_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
			
	segundos -= 1
			
	timer_count.text = str ("%02d" % minutos) + ":" + str("%02d" % segundos)
	
