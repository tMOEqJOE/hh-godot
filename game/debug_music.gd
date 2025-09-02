extends SGFixedNode2D

var song_index = 3
var min_index = 3
var max_index = Global.BGM_LIST.size()-1

func _on_next_song_button_pressed() -> void:
	Global.BGM_ID = song_index
	MainMenuMusicControl.play_song(Global.BGM_ID)
	song_index += 1
	if (song_index > max_index):
		song_index = min_index

func _on_random_song_button_pressed() -> void:
	MainMenuMusicControl.play_random_once_song()
