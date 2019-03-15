extends Node2D

export var velocidade = -400

var cena

func _ready():
	
	#get_tree() -->pega toda a árvore do jogo
	#get_current_scene() --> pega a cena atual
	cena = get_tree().get_current_scene()
	
	#queremos que a cada frame (atualização) do cano ele ande um pouco
	#para a esquerda, então verificamos cada frame 
	
	set_process(true)
	
#delta ----> tempo que passou entre os frames
#get_pos() ---> posicao atual, pois queremos alterara posição atual
# alteramos o eixo x e o eixo y mantemos em 0
func _process(delta):
	
	if cena.estado == cena.JOGANDO:
		set_pos(get_pos() + Vector2(velocidade* delta, 0))
	
	#destroi o cano quando ele chega na posicao x < -100 
	if get_pos().x < -100:
		queue_free()
		

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Felpudo":
		cena.kill()
	


func _on_Ponto_body_enter( body ):
	cena.pontuar()
