class_name StateIdle extends State

@onready var walk_state: StateWalk = %WalkState
@onready var attack_state: StateAttack = %AttackState

func _ready():
	pass


# Player enters this state
func enter():
	match player.facing:
		player.Facing.FRONT:
			player.sprite.flip_h = false
			player.sprite.play("front_idle")
		player.Facing.BACK:
			player.sprite.flip_h = false
			player.sprite.play("back_idle")
		player.Facing.LEFT:
			player.sprite.flip_h = !false
			player.sprite.play("side_idle")
		player.Facing.RIGHT:
			player.sprite.flip_h = !true
			player.sprite.play("side_idle")

# Player exits this state
func exit():
	pass


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	if player.dir != Vector2.ZERO:
		return walk_state
	player.velocity = Vector2.ZERO
	return null


func handle_input(_e: InputEvent) -> State:
	if _e.is_action_pressed("attack"):
		print("atk")
		return attack_state
	return null
