extends Control







func _on_car_raceData(time, laps):
	$Label.text = "Laps: " + str(laps)
	$Laptime_label.text = "Last Time: " + str(time)
