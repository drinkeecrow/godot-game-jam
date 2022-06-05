extends Node2D

var inventory_mutation = []
var inventory_rarity = []
var mutations = ["Density", "Digestion", "Photosynthesis", "Reproduction", "Resilient", "Survival"]
var selection_rare = []
var selection_mutation = []
var ball_prefab=preload("res://Assets/Prefabs/Ball/Ballmeba.tscn")
var activeBalls = 0

var mutation_data = {
	"Density": {
		"Title": "Density",
		"Description": {
			"Common": "Makes your cell extra dense.  It's very heavy.",
			"Rare": "Makes your cell extra dense.  It's very heavy.",
			"Epic": "Makes your cell extra dense.  It's very heavy."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
	"Digestion": {
		"Title": "Digestion",
		"Description": {
			"Common": "Allows your cell to digest pegs.  After hitting 15 pegs, that peg will be digested and multiply your cells score by 2.",
			"Rare": "Allows your cell to digest pegs.  After hitting 10 pegs, that peg will be digested and multiply your cells score by 3.",
			"Epic": "Allows your cell to digest pegs.  After hitting 7 pegs, that peg will be digested and multiply your cells score by 4."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
	"Photosynthesis": {
		"Title": "Photosynthesis",
		"Description": {
			"Common": "Your cell is fed from the sun.  It gains 4 DNA every 5 seconds.",
			"Rare": "Your cell is fed from the sun.  It gains 8 DNA every 6 seconds.",
			"Epic": "Your cell is fed from the sun.  It gains 50 DNA every 7 seconds."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
	"Reproduction": {
		"Title": "Reproduction",
		"Description": {
			"Common": "Your cell can now reproduce.  Gain an extra cell after hitting 20 pegs.",
			"Rare": "Your cell can now reproduce.  Gain an extra cell after hitting 15 pegs.",
			"Epic": "Your cell can now reproduce.  Gain an extra cell after hitting 10 pegs."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
	"Resilient": {
		"Title": "Resilient",
		"Description": {
			"Common": "Your cell gains some extra padding, allowing it to bounce more.",
			"Rare": "Your cell gains some extra padding, allowing it to bounce more.",
			"Epic": "Your cell gains some extra padding, allowing it to bounce more."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
		"Survival": {
		"Title": "Survival",
		"Description": {
			"Common": "Your cell has gained some survival instincts.  It will respawn after dying one time.",
			"Rare": "Your cell has gained some survival instincts.  It will respawn after dying two times.",
			"Epic": "Your cell has gained some survival instincts.  It will respawn after dying three times."
			},
		"Cost": {
			"Common": 50,
			"Rare": 100,
			 "Epic": 500
			}
	},
}

var mutation_prefabs = {
	"Density": preload("res://Assets/Prefabs/BallUpgrades/density.tscn"),
	"Digestion": preload("res://Assets/Prefabs/BallUpgrades/digestion.tscn"),
	"Photosynthesis": preload("res://Assets/Prefabs/BallUpgrades/photosynthisis.tscn"),
	"Reproduction": preload("res://Assets/Prefabs/BallUpgrades/reproduction.tscn"),
	"Resilient": preload("res://Assets/Prefabs/BallUpgrades/resilient.tscn"),
	"Survival": preload("res://Assets/Prefabs/BallUpgrades/Survival.tscn")}

var mutation_icons = {
	"Density": preload("res://Assets/Images/density.png"),
	"Digestion": preload("res://Assets/Images/digestion.png"),
	"Photosynthesis": preload("res://Assets/Images/photosynth.png"),
	"Reproduction": preload("res://Assets/Images/reproduction.png"),
	"Resilient": preload("res://Assets/Images/Resiliance.png"),
	"Survival": preload("res://Assets/Images/Survival.png")}

var rarity_icons = {
	"Common": preload("res://Assets/Images/commonBackground.png"),
	"Rare": preload("res://Assets/Images/rareBackground.png"),
	"Epic": preload("res://Assets/Images/epicBackground.png")}


func _ready():
	skill_selection()

func skill_selection():
	selection_rare = []
	selection_mutation = []
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
	
	$Popup/SelectButtons/seleciton1/Tooltip/Cost.text = str(mutation_data[selection_mutation[0]]["Cost"][selection_rare[0]])
	$Popup/SelectButtons/seleciton2/Tooltip/Cost.text = str(mutation_data[selection_mutation[1]]["Cost"][selection_rare[1]])
	$Popup/SelectButtons/seleciton3/Tooltip/Cost.text = str(mutation_data[selection_mutation[2]]["Cost"][selection_rare[2]])
	$Popup/SelectButtons/seleciton4/Tooltip/Cost.text = str(mutation_data[selection_mutation[3]]["Cost"][selection_rare[3]])
	
	$Popup/SelectButtons/seleciton1/Tooltip/Description.text = mutation_data[selection_mutation[0]]["Description"][selection_rare[0]]
	$Popup/SelectButtons/seleciton2/Tooltip/Description.text = mutation_data[selection_mutation[1]]["Description"][selection_rare[1]]
	$Popup/SelectButtons/seleciton3/Tooltip/Description.text = mutation_data[selection_mutation[2]]["Description"][selection_rare[2]]
	$Popup/SelectButtons/seleciton4/Tooltip/Description.text = mutation_data[selection_mutation[3]]["Description"][selection_rare[3]]
	
	$Popup/SelectButtons/seleciton1/Tooltip/Title.text = mutation_data[selection_mutation[0]]["Title"] + " - " + selection_rare[0]
	$Popup/SelectButtons/seleciton2/Tooltip/Title.text = mutation_data[selection_mutation[1]]["Title"] + " - " + selection_rare[1]
	$Popup/SelectButtons/seleciton3/Tooltip/Title.text = mutation_data[selection_mutation[2]]["Title"] + " - " + selection_rare[2]
	$Popup/SelectButtons/seleciton4/Tooltip/Title.text = mutation_data[selection_mutation[3]]["Title"] + " - " + selection_rare[3]

func _on_seleciton1_pressed():
	inventory_mutation.append(selection_mutation[0])
	inventory_rarity.append(selection_rare[0])
	$Popup/SelectButtons/seleciton1/Tooltip.visible = false
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton2_pressed():
	inventory_mutation.append(selection_mutation[1])
	inventory_rarity.append(selection_rare[1])
	$Popup/SelectButtons/seleciton2/Tooltip.visible = false
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton3_pressed():
	inventory_mutation.append(selection_mutation[2])
	inventory_rarity.append(selection_rare[2])
	$Popup/SelectButtons/seleciton3/Tooltip.visible = false
	$Popup.visible=false
	update_main_screen_inventory()
	start_round()

func _on_seleciton4_pressed():
	inventory_mutation.append(selection_mutation[3])
	inventory_rarity.append(selection_rare[3])
	$Popup.visible=false
	$Popup/SelectButtons/seleciton4/Tooltip.visible = false
	update_main_screen_inventory()
	start_round()

func update_main_screen_inventory():
	var mutations_node = get_tree().get_root().get_node("World/Mutations")	
	if inventory_mutation.size() > 0:
		mutations_node.get_node("Selection1").get_node("rare").texture = rarity_icons[inventory_rarity[0]]
		mutations_node.get_node("Selection1").get_node("icon").texture = mutation_icons[inventory_mutation[0]]
		mutations_node.get_node("Selection1").get_node("Tooltip").get_node("Cost").text = str(mutation_data[inventory_mutation[0]]["Cost"][inventory_rarity[0]])
		mutations_node.get_node("Selection1").get_node("Tooltip").get_node("Description").text = mutation_data[inventory_mutation[0]]["Description"][inventory_rarity[0]]
		mutations_node.get_node("Selection1").get_node("Tooltip").get_node("Title").text = mutation_data[inventory_mutation[0]]["Title"] + " - " + inventory_rarity[0]
	if inventory_mutation.size() > 1:
		mutations_node.get_node("Selection2").get_node("rare").texture = rarity_icons[inventory_rarity[1]]
		mutations_node.get_node("Selection2").get_node("icon").texture = mutation_icons[inventory_mutation[1]]
		mutations_node.get_node("Selection2").get_node("Tooltip").get_node("Cost").text = str(mutation_data[inventory_mutation[1]]["Cost"][inventory_rarity[1]])
		mutations_node.get_node("Selection2").get_node("Tooltip").get_node("Description").text = mutation_data[inventory_mutation[1]]["Description"][inventory_rarity[1]]
		mutations_node.get_node("Selection2").get_node("Tooltip").get_node("Title").text = mutation_data[inventory_mutation[1]]["Title"] + " - " + inventory_rarity[1]
	if inventory_mutation.size() > 2:
		mutations_node.get_node("Selection3").get_node("rare").texture = rarity_icons[inventory_rarity[2]]
		mutations_node.get_node("Selection3").get_node("icon").texture = mutation_icons[inventory_mutation[2]]
		mutations_node.get_node("Selection3").get_node("Tooltip").get_node("Cost").text = str(mutation_data[inventory_mutation[2]]["Cost"][inventory_rarity[2]])
		mutations_node.get_node("Selection3").get_node("Tooltip").get_node("Description").text = mutation_data[inventory_mutation[2]]["Description"][inventory_rarity[2]]
		mutations_node.get_node("Selection3").get_node("Tooltip").get_node("Title").text = mutation_data[inventory_mutation[2]]["Title"] + " - " + inventory_rarity[2]
	if inventory_mutation.size() > 3:
		mutations_node.get_node("Selection4").get_node("rare").texture = rarity_icons[inventory_rarity[3]]
		mutations_node.get_node("Selection4").get_node("icon").texture = mutation_icons[inventory_mutation[3]]
		mutations_node.get_node("Selection4").get_node("Tooltip").get_node("Cost").text = str(mutation_data[inventory_mutation[3]]["Cost"][inventory_rarity[3]])
		mutations_node.get_node("Selection4").get_node("Tooltip").get_node("Description").text = mutation_data[inventory_mutation[3]]["Description"][inventory_rarity[3]]
		mutations_node.get_node("Selection4").get_node("Tooltip").get_node("Title").text = mutation_data[inventory_mutation[3]]["Title"] + " - " + inventory_rarity[3]
	
func start_round():
	var ball_node = ball_prefab.instance()
	get_tree().get_root().get_node("World").add_child(ball_node)
	
	var i = 0
	for m in inventory_mutation:
		var upgrade = mutation_prefabs[m].instance()
		upgrade.rare = inventory_rarity[i]
		ball_node.get_node("Upgrades").add_child(upgrade)
		i +=1
	


