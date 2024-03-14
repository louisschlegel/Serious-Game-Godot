extends CharacterBody2D

var animationPlayer = null
var animationTree = null
var animationState = null
var inDialogue:bool = false

var state = MOVE
var timerMovement
var pnjMovement = []
var boolPnjMovement = false


enum CharacterType {
	PLAYER,
	PNJ,
}


var type:CharacterType

const MAX_SPEED = 100
const ACCELERATION = 500
const FRICTION = 500




func _ready():
	timerMovement = $Movement
	animationPlayer = $AnimationPlayer
	animationTree = $AnimationTree
	animationState = animationTree.get("parameters/playback")
	ready_child()
	
	
func _physics_process(delta):
	checkPnjMove()
	match state:
		MOVE:
			move_state(delta)
		PUNCH:
			punch_state(delta)


enum {
	MOVE,
	PUNCH,
	PNJ,
	DEATH
}

func ready_child():
	pass



func punch_state(delta):
	velocity = Vector2.ZERO
	var input_vector = animationTree.get("parameters/Idle/blend_position")
	animationState.travel("Punch")
	
	#animationTree.set("parameters/Idle/blend_position", input_vector)

func print_type():
	print(type)

func checkPnjMove():
	if pnjMovement.size() > 0 and !boolPnjMovement:
		state = MOVE
		boolPnjMovement = true
		timerMovement.wait_time = pnjMovement[1]
		timerMovement.start()

func move_state(delta):
	var input_vector = Vector2.ZERO
	
	if type == 0:
		input_vector.x =  Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		input_vector = input_vector.normalized()
	if type == 1 and boolPnjMovement:
		input_vector = pnjMovement[0]
	
	if !inDialogue:
		if input_vector != Vector2.ZERO:
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Run/blend_position", input_vector)
			animationTree.set("parameters/Punch/blend_position", input_vector)
			animationState.travel("Run")
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
	if Input.is_action_just_pressed("punch") and type == 0 and !inDialogue:
		set_punch_state()

func set_punch_state():
	state = PUNCH

func punch_animation_finished():
	state = MOVE

func die():
	if state != DEATH:
		state = DEATH
		animationPlayer.play("DeathDown")
	
func revive():
	if type == 1:
		state = PNJ
	else:
		state = MOVE
	animationPlayer.play("Revive")

func add_movement(vec:Vector2, time):
	pnjMovement.append(vec)
	pnjMovement.append(time)
	
	
func _on_movement_timeout():
	boolPnjMovement = false
	animationState.travel("Idle")
	state = PNJ
	pnjMovement.pop_at(0)
	pnjMovement.pop_at(0)
	
func action_of_pnj():
	pass

func action_when_die():
	pass

func action_when_revive():
	pass
