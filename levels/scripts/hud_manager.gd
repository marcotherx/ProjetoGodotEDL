extends Control
@onready var moedass_counter = $container/moedass_container/moedass_counter as Label
@onready var score_counter_2 = $container/score_container2/score_counter2 as Label
@onready var life_counter = $container/life_container/life_counter as Label
@onready var timer_counter2 = $container/timer_container3/timer_counter2 as Label
@onready var clock_timer = $clock_timer as Timer

var minutes = 0
var seconds = 0
@export_range(0, 5) var default_minutes := 1
@export_range(0,59) var default_seconds := 0

signal time_is_up()

# Called when the node enters the scene tree for the first time.
func _ready():
	moedass_counter.text = str("%04d" % Globals.moedass)
	score_counter_2.text = str("%06d" % Globals.score)
	life_counter.text = str("%02d" % Globals.player_life)
	timer_counter2.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moedass_counter.text = str("%04d" % Globals.moedass)
	score_counter_2.text = str("%06d" % Globals.score)
	life_counter.text = str("%02d" % Globals.player_life)
	if minutes == 0 and seconds == 0:
		emit_signal("time_is_up")

func _on_clock_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	
	timer_counter2.text = str("%02d" % minutes) + ":" + str("%02d" % seconds)
func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds
