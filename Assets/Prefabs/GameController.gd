extends Node2D

var inventory_mutation = []
var inventory_rarity = []
var mutations = ["Density", "Digestion", "Photosynthsis", "Reproduction", "Resilient", "Survival"]
var selection_rare = []
var selection_mutation = []
var ball_prefab=preload("res://Assets/Prefabs/Ball/Ballmeba.tscn")
var activeBalls = 0

var mutation_prefabs = {
	"Density": preload("res://Assets/Prefabs/BallUpgrades/density.tscn"),
	"Digestion": preload("res://Assets/Prefabs/BallUpgrades/digestion.tscn"),
	"Photosynthsis": preload("res://Assets/Prefabs/BallUpgrades/photosynthisis.tscn"),
	"Reproduction": preload("res://Assets/Prefabs/BallUpgrades/reproduction.tscn"),
	"Resilient": preload("res://Assets/Prefabs/BallUpgrades/resilient.tscn"),
	"Survival": preload("res://Assets/Prefabs/BallUpgrades/Survival.tscn")}

var mutation_icons = {
	"Density": preload("res://Assets/Images/density.png"),
	"Digestion": preload("res://Assets/Images/digestion.png"),
	"Photosynthsis": preload("res://Assets/Images/photosynth.png"),
	"Reproduction": preload("res://Assets/Images/reproduction.png"),
	"Resilient": preload("res://Assets/Images/Resiliance.png"),
	"Survival": preload("res://Assets/Images/Survival.png")}

var rarity_icons = {
	"Common": preload("res://Assets/Images/commonBackground.png"),
	"Rare": preload("res://Assets/Images/rareBackground.png"),
	"Epic": preload("res://Assets/Images/epicBackground.png")}


func _ready():
	skill_selection()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func skill_selection():
	$Popup.visible = true
	var rng = RandomNumberGenerator.new()
	for x in 4:
		rng.randomize()
		var rndNum = rng.randi_range(1,100)
		if rndNum >= 90:
			selection_rare.append("Epic")
		elif rndNum >= 60:
			selection_rare.append("Rare")
		else:
			selection_rare.append("Common")
		rng.randomize()
		selection_mutation.append(mutations[rng.randi_range(0,mutations.size()-1)])
	$Popup/SelectButtons/seleciton1/rarity.texture=rarity_icons[selection_rare[0]]
	$Popup/SelectButtons/seleciton2/rarity.texture=rarity_icons[selection_rare[1]]
	$Popup/SelectButtons/seleciton3/rarity.texture=rarity_icons[selection_rare[2]]
	$Popup/SelectButtons/seleciton4/rarity.texture=rarity_icons[selection_rare[3]]
	
	$Popup/SelectButtons/seleciton1/icon.texture=mutation_icons[selection_mutation[0]]
	$Popup/SelectButtons/seleciton2/icon.texture=mutation_icons[selection_mutation[1]]
	$Popup/SelectButtons/seleciton3/icon.texture=mutation_icons[selection_mutation[2]]
	$Popup/SelectButtons/seleciton4/icon.texture=mutation_icons[selection_mutation[3]]

func _on_seleciton1_pressed():
	inventory_mutation.append(selection_mutation[0])
	inventory_rarity.append(selection_rare[0])
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton2_pressed():
	inventory_mutation.append(selection_mutation[1])
	inventory_rarity.append(selection_rare[1])
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton3_pressed():
	inventory_mutation.append(selection_mutation[2])
	inventory_rarity.append(selection_rare[2])
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton4_pressed():
	inventory_mutation.append(selection_mutation[3])
	inventory_rarity.append(selection_rare[3])
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func update_main_screen_inventory():
	var mutations_node = get_tree().get_root().get_node("World/Mutations")	
	if inventory_mutation.size() > 0:
		mutations_node.get_node("Selection1").get_node("rare").texture = rarity_icons[inventory_rarity[0]]
		mutations_node.get_node("Selection1").get_node("icon").texture = mutation_icons[inventory_mutation[0]]
	if inventory_mutation.size() > 1:
		mutations_node.get_node("Selection2").get_node("rare").texture = rarity_icons[inventory_rarity[1]]
		mutations_node.get_node("Selection2").get_node("icon").texture = mutation_icons[inventory_mutation[1]]
	if inventory_mutation.size() > 2:
		mutations_node.get_node("Selection3").get_node("rare").texture = rarity_icons[inventory_rarity[2]]
		mutations_node.get_node("Selection3").get_node("icon").texture = mutation_icons[inventory_mutation[2]]
	if inventory_mutation.size() > 3:
		mutations_node.get_node("Selection4").get_node("rare").texture = rarity_icons[inventory_rarity[3]]
		mutations_node.get_node("Selection4").get_node("icon").texture = mutation_icons[inventory_mutation[3]]
	
func start_round():
	var ball_node = ball_prefab.instance()
	get_tree().get_root().get_node("World").add_child(ball_node)
	
	for m in inventory_mutation:
		var upgrade = mutation_prefabs[m].instance()
		#add rareity
		ball_node.get_node("Upgrades").add_child(upgrade)
	


