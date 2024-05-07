extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1800

@onready var anim = get_node("AnimationPlayer")
@onready var effects = get_node("Effects")
@onready var hurtTimer = get_node("HurtTimer")

func _ready():
	effects.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_running:
			anim.play("idle")
		else:
			$RunCol.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
			elif Input.is_action_pressed("ui_down"):
				$RunCol.disabled = true
			else:
				anim.play("run")
	else:
		anim.play("jump")
		
	move_and_slide()
