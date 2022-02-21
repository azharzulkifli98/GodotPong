extends Node2D

var playerscore = 0
var opponentscore = 0


func _on_Player_Goal_body_entered(body):
	$Ball.velocity.x = -1
	opponentscore += 1
	game_update()


func _on_Opponent_Goal_body_entered(body):
	$Ball.velocity.x = 1
	playerscore += 1
	game_update()

func _process(delta):
	$Score.text = str(playerscore, "  VS  ", opponentscore)


func _on_Countdown_timeout():
	get_tree().call_group("BallGroup", "start_ball")

func game_update():
	$Ball.position = Vector2(524, 280)
	get_tree().call_group("BallGroup", "stop_ball")
	$Countdown.start()

