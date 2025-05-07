extends Node2D

func freeze():
	if ($ParallaxBackground != null):
		$ParallaxBackground.freeze()

func unfreeze():
	if ($ParallaxBackground != null):
		$ParallaxBackground.unfreeze()

func load_stage():
	if (get_child_count() == 0):
		add_stage_as_child()
	else:
		if (Global.STAGE_ART_ID == 2):
			remove_current_stage()
			Global.LOADED_STAGE_BACKGROUND
			if (is_instance_valid(Global.load_queue.get_stage_background()) and 
					Global.load_queue.get_stage_background() != null):
				Global.load_queue.get_stage_background().queue_free()
				Global.LOADED_STAGE_BACKGROUND = null
			add_stage_as_child()

func remove_current_stage():
	for child_node in self.get_children():
		self.remove_child(child_node)
		child_node.queue_free()

func add_stage_as_child():
	if (not is_instance_valid(Global.load_queue.get_stage_background())):
		Global.load_queue.load_stage_art()
	add_child(Global.load_queue.get_stage_background())
