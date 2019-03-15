extends RigidBody2D

var cena

func _ready():
	cena = get_tree().get_current_scene()
	# set_process_input(true) irámonitorar todos os comandos que
	# dermos no pássarp
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("touch"):
		on_touch()
		
func on_touch():
	if cena.estado == cena.JOGANDO:
		apply_impulse(Vector2(0,0), Vector2(0,-800))
		get_node("SomVoa").play()