extends Node2D


var total_coins = 0
var collected_coins = 0

@onready var win_label = $WinLabel
@onready var win_label_anim = $WinLabel/AnimationPlayer
@onready var music = $AudioStreamPlayer

func _ready():
	music.play()
	total_coins = get_tree().get_nodes_in_group("coins").size()
	
	if total_coins == 0:
		print("HATA: Sahnede 'coins' grubuna ait hiç coin bulunamadı!")
		return

	for coin in get_tree().get_nodes_in_group("coins"):

		coin.coin_collected.connect(_on_coin_collected)

func _on_coin_collected():

	collected_coins += 1
	
	print("Coin toplandı! Durum: ", collected_coins, " / ", total_coins) 
	
	if collected_coins == total_coins:
		_show_win_message() 

func _show_win_message():
	win_label.show()
	win_label_anim.play("bobbing")
	get_tree().paused = true
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		# Oyunu kapat komutu
		get_tree().quit()
