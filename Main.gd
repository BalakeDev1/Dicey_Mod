extends PanelContainer

onready var TabContainer = find_node("TabContainer")
onready var ModSettings = find_node("Mod Settings")
onready var Enemies = find_node("Enemies")
onready var Equipment = find_node("Equipment")

func _ready():
	# Disable auto accept quit to be able to ask for saving before quitting
	get_tree().set_auto_accept_quit(false)
	# Disable tabs
	TabContainer.set_tab_disabled(1, true)
	TabContainer.set_tab_disabled(2, true)
	Database.connect("data_loaded", self, "_on_Database_data_loaded")
	
func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		# TODO check if there's stuff to save and ask before quitting
		print("Are you sure?")
		get_tree().quit()
		
func _on_Database_data_loaded():
	TabContainer.set_tab_disabled(1, false)
	TabContainer.set_tab_disabled(2, false)
	
	Enemies.TreeList.start_load()
	Equipment.ItemList.start_load()
