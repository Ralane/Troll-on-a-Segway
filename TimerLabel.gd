extends Label

var aliveTime = 0;
var paused = false;

func unpause():
	paused = false;

func pause():
	paused = true;

func _process(delta):
	if(!paused):
		aliveTime += delta;
	text = _seconds_to_timer_text(aliveTime);

func _seconds_to_timer_text(time):
	var msec = fmod(time, 1) * 100
	var seconds = fmod(time, 60)
	var minutes = fmod(time, 3600) / 60
	
	return ("%02d:" % minutes) + ("%02d." % seconds) + ("%02d" % msec);