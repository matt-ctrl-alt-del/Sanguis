extends Control

@export_file("*.tscn") var next_scene : String
@export var base_text : String = "Loading"
@export var loading_duration : float = 4.0

@onready var label : Label = $VBoxContainer/Label
var dots := ["",".","..","...","..","."]

func _ready() -> void:
	get_tree().create_timer(loading_duration).timeout.connect(_on_time_up)

func _process(delta: float) -> void:
	var index = int(Time.get_ticks_msec() / 350.0) % dots.size()
	label.text = base_text + dots[index]
	
func _on_time_up() -> void:
	if next_scene != "":
		get_tree().change_scene_to_file(next_scene)
	else:
		print("Error. Add a scene.")
