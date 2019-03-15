extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timereplay = get_node("TimerToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1
const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass

func kill():
	
	#impulso para joga-lo para trás quando encostar no cano
	# Vector2(-1000,0) ---> a força do impulso
	felpudo.apply_impulse(Vector2(0,0), Vector2(-1000,0))
	
	#parar a animação de fundo
	get_node("BackAnim").stop()
	estado = PERDENDO
	timereplay.start()
	
	get_node("SomHit").play()
	
func pontuar():
	pontos +=1
	label.set_text(str(pontos))
	
	get_node("SomScore").play()
	
#a hora que acabar o tempo iremos reiniciar a cena
func _on_TimerToReplay_timeout():
	get_tree().reload_current_scene()

