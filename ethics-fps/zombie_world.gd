extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	$Crosshair.position = Vector3(1,1,0)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	$Crosshair.position = Vector3(1,-1,0)
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	$Crosshair.position = Vector3(-1,1,0)
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	$Crosshair.position = Vector3(-1,-1,0)
	pass # Replace with function body.
