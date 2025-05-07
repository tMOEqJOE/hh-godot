extends Label

func update_win_count(is_p1: bool):
	if (is_p1):
		self.text = str(Global.P1_SET_WIN_TOTAL)+"/"+str(Global.SET_TOTAL)+"/  "+str(Global.P1_WIN_TOTAL)+"/"+str(Global.MATCH_TOTAL)
	else:
		self.text = str(Global.SET_TOTAL-Global.P1_SET_WIN_TOTAL)+"/"+str(Global.SET_TOTAL)+"/  "+str(Global.MATCH_TOTAL-Global.P1_WIN_TOTAL)+"/"+str(Global.MATCH_TOTAL)

func update_total_count(is_p1: bool):
	if (is_p1):
		self.text = str(Global.P1_WIN_TOTAL)+"/"+str(Global.MATCH_TOTAL)
	else:
		self.text = str(Global.MATCH_TOTAL-Global.P1_WIN_TOTAL)+"/"+str(Global.MATCH_TOTAL)
