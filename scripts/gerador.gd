extends Position2D

#onready --> quando o cano estiver pronto, ele será carregado para
# a variável cano
onready var cano = preload("res://scenes/cano.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	var novocano = cano.instance()
	
	#iremos randomizar a posição de y para o canos ir
	#para cima e para baixo
	novocano.set_pos(get_pos() + Vector2(0,rand_range(-500,500)))
	
	#sabemos que o gerador é filho de canos 
	#get_owner() ---> pega o pai de gerador
	get_owner().add_child(novocano)
