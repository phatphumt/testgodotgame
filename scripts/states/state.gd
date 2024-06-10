class_name State extends Node

static var player: Player

func _ready():
	pass
	

# Player enters this state
func enter() -> void:
	pass


# Player exits this state
func exit() -> void:
	pass


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	return null


func handle_input(_e: InputEvent) -> State:
	return null
