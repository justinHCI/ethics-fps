extends Node3D



@onready var question: Label = $"../UI/Control/Question"
@onready var button_1: Button = $"../UI/Control/Button1"
@onready var button_2: Button = $"../UI/Control/Button2"
@onready var button_3: Button = $"../UI/Control/Button3"
@onready var button_4: Button = $"../UI/Control/Button4"
@onready var sprite_3d: Sprite3D = $Crosshair/Sprite3D
var zomb_scene = preload("res://zomb.tscn")

#global vars
var sample = []
var timer = 0.0
var health = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_a_question()
	$Zomb.play()
	#$Zomb.position = Vector3(-5, 3.5, -3)
	$Zomb.position = Vector3(5, 3.5, -3)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= 2.0:
		timer -= 2.0
		move_zombs()
		spawn_chance()
		


func _on_button_1_pressed() -> void:
	var x  = -int(sample[0][2]) + int(sample[0][3])
	x = normalize_x(x)
	var y = int(sample[0][4]) - int(sample[0][5])
	y = normalize_y(y)
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_callback(check_hit.bind(x,y))
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()

func _on_button_2_pressed() -> void:
	var x  = -int(sample[1][2]) + int(sample[1][3])
	x = normalize_x(x)
	var y = int(sample[1][4]) - int(sample[1][5])
	y = normalize_y(y)
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_callback(check_hit.bind(x,y))
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()

func _on_button_3_pressed() -> void:
	var x  = -int(sample[2][2]) + int(sample[2][3])
	x = normalize_x(x)
	var y = int(sample[2][4]) - int(sample[2][5])
	y = normalize_y(y)
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_callback(check_hit.bind(x,y))
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 0.0, 0.5)
	tween.tween_property($Crosshair, "position", Vector3(0, 0, 0), .2)
	tween.tween_property($Crosshair/Sprite3D, "modulate:a", 1.0, 1.0)
	_get_a_question()

func _on_button_4_pressed() -> void:
	var x  = -int(sample[3][2]) + int(sample[3][3])
	x = normalize_x(x)
	var y = int(sample[3][4]) - int(sample[3][5])
	y = normalize_y(y)
	var tween = create_tween()
	tween.tween_property($Crosshair, "position", Vector3(x, y, 0), .2)
	tween.tween_callback(check_hit.bind(x,y))
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

func normalize_x(x) -> int:
	if x > 1:
		x = 3
	elif x < -1:
		x=-3
	else:
		if randf() < 0.5:
			x = -3
		else:
			x = 3
	return x

func normalize_y(y) -> int:
	if y > 0:
		y = 2.
	elif y < 0:
		y=-2.
	if y == 0:
		if randf() < 0.5:
			y = -2.
		else:
			y = 2.
	return y

func _on_mute_button_pressed() -> void:
	$song.playing = not $song.playing

func spawn_chance() -> void:
	if randf() < 0.25:
		var zomb = zomb_scene.instantiate()
		zomb.add_to_group("zombs")
		if randf() < 0.5:
			zomb.position = Vector3(-5, 3.5, -3)
		else:
			zomb.position = Vector3(5, 3.5, -3)
		zomb.animation=(["green","yellow","teal","blue"].pick_random())
		zomb.frame= [0,1,2].pick_random()
		zomb.play()
		get_tree().current_scene.add_child(zomb)

func move_zombs() -> void:
	var zombs = get_tree().get_nodes_in_group("zombs")
	for zomb in zombs:
		var tween = create_tween().set_parallel(true)
		tween.tween_property(zomb, "position",Vector3(0,-1, .000001), 1).as_relative()
		tween.tween_property(zomb, "scale",Vector3(.8,.8,.8), 1).as_relative()
		if zomb.position.y < 0:
			if zomb.animation=="blue":
				zomb.animation="blue_des"
			if zomb.animation=="green":
				zomb.animation="green_des"
			if zomb.animation=="yellow":
				zomb.animation="yellow_des"
			if zomb.animation=="teal":
				zomb.animation="teal_des"
		if zomb.position.y < -3:
			zomb.queue_free()
			take_damage()

func take_damage() -> void:
	if health == 1:
		get_tree().change_scene_to_file("res://scenes/died.tscn")
	else:
		var hearts = [$"../UI/Control/Health/heart", $"../UI/Control/Health/heart2", $"../UI/Control/Health/heart3", $"../UI/Control/Health/heart4", $"../UI/Control/Health/heart5"]
		hearts[health-1].visible = false
		health-=1
	
func check_hit(x,y):
	var zombs = get_tree().get_nodes_in_group("zombs")
	var target_zomb = null
	for zomb in zombs:
		if (x > 1 and zomb.position.x < 0) or (x < 1 and zomb.position.x > 0):
			continue
		if (y > 1 and zomb.position.y < 0) or (y < 1 and zomb.position.y >= 0):
			continue
		if target_zomb == null or zomb.position.z > target_zomb.position.z:
			target_zomb = zomb
		if target_zomb != null:
			target_zomb.queue_free()
	$gunshot.play()
	$gun_reload.play()
	
