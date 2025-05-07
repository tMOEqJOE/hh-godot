extends Node2D

var id: int

func set_id (new_id: int):
	self.position.y = 200 + new_id*100
	move_reset()
	$Label.text = str(new_id)

func move_p1():
	MainMenuMusicControl.play_cursor_move()
	self.position.x = 450

func move_p2():
	MainMenuMusicControl.play_cursor_move()
	self.position.x = 1450

func move_reset():
	MainMenuMusicControl.play_cursor_move()
	self.position.x = 950
