extends HBoxContainer

@onready var HeartGuiClass = preload("res://heart.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setMaxHearts(max :int):
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func updateHearts(currentHealth: int):
	var hearts = get_children()
	
	for i in range(currentHealth):
		hearts[currentHealth].update(true)
		
	for i in range(currentHealth, hearts.size()):
		hearts[i].update(false)

func resetHearts(max: int):
	var hearts = get_children()
	if hearts.size() > max:
		hearts[max+1].update(true)
