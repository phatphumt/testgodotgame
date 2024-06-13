class_name StateAttack extends State

@onready var idle_state = %IdleState
@onready var walk_state = %WalkState
@onready var sword_cooldown = %SwordCooldown
@onready var player_hurt_box: HurtBox = %PlayerHurtBox

@export var decel_speed: float = 5.0

# Player enters this state
func enter() -> void:
	player_hurt_box.monitoring = true
	player.attacking = true
	play_atk_anim()
	player.sprite.animation_finished.connect(end_attack)

# Player exits this state
func exit() -> void:
	player_hurt_box.monitoring = false


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	if player.attacking:
		return null
	
	if player.dir != Vector2.ZERO:
		player.velocity -= player.velocity * decel_speed
		return walk_state
	
	return idle_state


func handle_input(_e: InputEvent) -> State:
	return null


func end_attack():
	player.attacking = false


func play_atk_anim():
	match player.facing:
		player.Facing.FRONT:
			player.sprite.flip_h = false
			player.sprite.play("front_attack")
		player.Facing.BACK:
			player.sprite.flip_h = false
			player.sprite.play("back_attack")
		player.Facing.LEFT:
			player.sprite.flip_h = !false
			player.sprite.play("side_attack")
		player.Facing.RIGHT:
			player.sprite.flip_h = !true
			player.sprite.play("side_attack")
