extends CharacterBody2D

@onready var p_1: CharacterBody2D = $"../P1"
@onready var p_2: CharacterBody2D = $"../P3"
@onready var collision_shape_2d: CollisionShape2D = $"../P3/CollisionShape2D"

const SPEED2 = 500.0
const JUMP_VELOCITY = -400.0
var speed =300
var currentcollider
@onready var timer: Timer = $"../Timer"
func _ready() -> void:
	var randomX = [-1,1].pick_random()
	var randomY = [-randf_range(0.3,0.8), randf_range(0.3,0.8)].pick_random()
	velocity = Vector2(randomX,randomY).normalized() * speed
	currentcollider=null;

func _physics_process(delta: float) -> void: 
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	if (collision && (collision.get_collider() != currentcollider || !(currentcollider in get_tree().get_nodes_in_group("paddle")))):
		currentcollider=collision.get_collider()
		if speed<1000:
			speed += 25
		if collision.get_collider() in get_tree().get_nodes_in_group("paddle"):
			var paddle = collision.get_collider()
			var new_x:float = -abs(velocity.x) if position.x <= paddle.position.x else abs(velocity.x)
			var from_center:float = position.y - paddle.position.y
			if from_center > -5 and from_center < 5:
				print(from_center)
				velocity = velocity.bounce(collision.get_normal()) * delta
			else:
				velocity = Vector2(new_x, from_center*5)
		else:
			velocity = velocity.bounce(collision.get_normal())*delta
	if (velocity.x in range(0,200) ):
		velocity.x=300 
	if (velocity.x in range(-200,0) ):
		velocity.x=-300
