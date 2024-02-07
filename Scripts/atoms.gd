extends Node2D

@export var radius: float = 1
@export var mass: float = 1
@export var count: int = 100

func _ready():
	var atoms = createAtoms(radius, mass, "res://materials/redCircle.png", 100)


func createAtoms(radius: float, mass: float, texture: String, count: int) -> Array:
	var atoms = []
	for i in range(count):
		var atom = createAtom(radius, mass, texture)
		atom.position = Vector2(randf() * 1000, randf() * 1000)
		atoms.append(atom)
	return atoms

func createAtom(radius: float, mass: float, texture: String) -> Area2D:
	var atom = Area2D.new()	

	var circle = CircleShape2D.new()
	circle.radius = radius

	var collisionShape = CollisionShape2D.new()
	collisionShape.shape = circle
	var circleSprite = Sprite2D.new()
	circleSprite.texture = load(texture)
	circleSprite.scale = Vector2(radius * 0.02, radius * 0.02)
	
	add_child(atom)
	atom.add_child(collisionShape)
	atom.add_child(circleSprite)
	return atom



