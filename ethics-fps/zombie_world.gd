extends Node3D

@onready var question: Label = $"../UI/Control/Question"
@onready var button_1: Button = $"../UI/Control/Button1"
@onready var button_2: Button = $"../UI/Control/Button2"
@onready var button_3: Button = $"../UI/Control/Button3"
@onready var button_4: Button = $"../UI/Control/Button4"
@onready var sprite_3d: Sprite3D = $Crosshair/Sprite3D

#global vars
var sample = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_a_question()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_button_1_pressed() -> void:
	var x  = -int(sample[0][2]) + int(sample[0][3])
	if x > 1:
		x = 1
	elif x < -1:
		x=-1
	var y = int(sample[0][4]) - int(sample[0][5])
	if y > 1:
		y = 1
	elif y < -1:
		y=-1
	if y == 0:
		if randf() < 0.5:
			y = -1
		else:
			y = 1
	if x == 0:
		if randf() < 0.5:
			x = -1
		else:
			x = 1
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()

func _on_button_2_pressed() -> void:
	var x  = -int(sample[1][2]) + int(sample[1][3])
	if x > 1:
		x = 1
	elif x < -1:
		x=-1
	var y = int(sample[1][4]) - int(sample[1][5])
	if y > 1:
		y = 1
	elif y < -1:
		y=-1
	if y == 0:
		if randf() < 0.5:
			y = -1
		else:
			y = 1
	if x == 0:
		if randf() < 0.5:
			x = -1
		else:
			x = 1
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()


func _on_button_3_pressed() -> void:
	var x  = -int(sample[2][2]) + int(sample[2][3])
	if x > 1:
		x = 1
	elif x < -1:
		x=-1
	var y = int(sample[2][4]) - int(sample[2][5])
	if y > 1:
		y = 1
	elif y < -1:
		y=-1
	if y == 0:
		if randf() < 0.5:
			y = -1
		else:
			y = 1
	if x == 0:
		if randf() < 0.5:
			x = -1
		else:
			x = 1
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()


func _on_button_4_pressed() -> void:
	var x  = -int(sample[3][2]) + int(sample[3][3])
	if x > 1:
		x = 1
	elif x < -1:
		x=-1
	var y = int(sample[3][4]) - int(sample[3][5])
	if y > 1:
		y = 1
	elif y < -1:
		y=-1
	if y == 0:
		if randf() < 0.5:
			y = -1
		else:
			y = 1
	if x == 0:
		if randf() < 0.5:
			x = -1
		else:
			x = 1
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()

func _get_a_question() -> void:
	button_1.visible=true
	button_2.visible=true
	button_3.visible=true
	button_4.visible=true
	var data = preload("res://questions.csv")
	var records = data.records
	var starts = []
	# Find the first row of each question
	for i in range(records.size()):
		if i == 0 or records[i][0] != records[i - 1][0]:
			starts.append(i)
	# Pick a random question
	var start = starts.pick_random()

	# Find the end of that question
	var end = records.size()
	for s in starts:
		if s > start:
			end = s
			break

	# Extract all rows for that question
	sample = records.slice(start, end)
	sample.shuffle()
	question.text = sample[0][0]
	button_1.text = sample[0][1]
	button_2.text = sample[1][1]
	if len(sample) == 2:
		button_3.visible=false
		button_4.visible=false
	elif len(sample) == 3:
		button_3.text = sample[2][1]
		button_4.visible=false
	elif len(sample)==4:	
		button_3.text = sample[2][1]
		button_4.text = sample[3][1]
	
	
	
