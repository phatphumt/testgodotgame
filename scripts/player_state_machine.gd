class_name PlayerStateMachine extends Node


var states: Array[State]
var prev_state: State
var curr_state: State


func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED	


func _process(delta):
	change_state(curr_state.process(delta))


func _physics_process(delta):
	change_state(curr_state.physics(delta))


func _unhandled_input(event):
	change_state(curr_state.handle_input(event))


func init(_player: Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() > 0:
		states[0].player = _player # Default State
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func change_state(new_state: State) -> void:
	if new_state == null or new_state == curr_state:
		return
	
	if curr_state:
		curr_state.exit()
	
	prev_state = curr_state
	curr_state = new_state
	curr_state.enter()
