extends Node2D

@export var radius: float = 5.0
@export var atom_scale: float = 0.5
@export var count: int = 5
@export var temperature: float = 1.0
@export var mass: float = 1.0


var gasConstant = 1.0
var velocity = sqrt(3 * gasConstant * temperature / mass)

func _ready():
	pass

var atoms1 = createAtoms(radius, mass, "res://materials/redCircle.png", count)
var atoms2 = createAtoms(radius*atom_scale, mass*atom_scale, "res://materials/blueCircle.png", count)

func _process(_delta: float):
	for atom in atoms1:
		atom.position += Vector2(velocity, 0)
		if atom.position.x > 1000:
			atom.position.x = 0


func createAtoms(atomRadius: float, atomMass: float, atomTexture: String, atomCount: int) -> Array:
	var atoms = []
	for i in range(atomCount):
		var atom = createAtom(atomRadius, atomMass, atomTexture)
		atom.position = Vector2(randf() * 1000, randf() * 1000)
		atoms.append(atom)
	return atoms

func createAtom(atomRadius: float, _mass: float, atomTexture: String) -> Area2D:
	var atom = Area2D.new()	
	var circle = CircleShape2D.new()
	circle.radius = atomRadius

	var collisionShape = CollisionShape2D.new()
	collisionShape.shape = circle
	var circleSprite = Sprite2D.new()
	circleSprite.texture = load(atomTexture)
	circleSprite.scale = Vector2(atomRadius * 0.02, atomRadius * 0.02)
	
	add_child(atom)
	atom.add_child(collisionShape)
	atom.add_child(circleSprite)
	return atom



