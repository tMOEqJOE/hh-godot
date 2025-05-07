class_name PlayerSetup

var left_face:bool
var team:bool
var point_chara:int
var point_color
var input_interpreter:InputInterpreter

func _init(
		p_left_face:bool,
		p_team:bool,
		p_point_chara:int, 
		p_point_color,
		p_input_interpreter:InputInterpreter):
	self.left_face = p_left_face
	self.team = p_team
	self.point_chara = p_point_chara
	self.point_color = p_point_color
	self.input_interpreter = p_input_interpreter
