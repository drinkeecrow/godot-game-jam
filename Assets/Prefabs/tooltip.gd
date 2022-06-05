extends Sprite

var title = "Title"
var description = "This is the description for the tooltip."
var cost = 50

func _ready():
	self.visible = false
	self.get_parent().connect("mouse_exited", self, "hide_tooltip")
	self.get_parent().connect("mouse_entered", self, "show_tooltip")

func hide_tooltip():
	self.visible = false

func show_tooltip():
	self.visible = true
