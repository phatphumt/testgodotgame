class_name StateWalk extends State

@export var speed: float = 100.0
@onready var idle_state = %IdleState
@onready var attack_state = %AttackState

func _ready():
	pass


# Player enters this state
func enter():
	match player.facing:
		player.Facing.FRONT:
			player.sprite.flip_h = false
			player.sprite.play("front_walk")
		player.Facing.BACK:
			player.sprite.flip_h = false
			player.sprite.play("back_walk")
		player.Facing.LEFT:
			player.sprite.flip_h = !false
			player.sprite.play("side_walk")
		player.Facing.RIGHT:
			player.sprite.flip_h = !true
			player.sprite.play("side_walk")
	

# Player exits this state
func exit():
	pass


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	if player.dir == Vector2.ZERO:
		return idle_state
	player.velocity = player.dir * speed
	player.turn_dir()
	return null


func handle_input(_e: InputEvent) -> State:
	if _e.is_action_pressed("attack") && !player.attacking:
		player.velocity = Vector2.ZERO
		return attack_state
	return null
