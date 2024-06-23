extends ItemList

func read_json(file_path):
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		var parse_result =  JSON.parse_string(file.get_as_text())
		
		if parse_result is Array:
			return  parse_result
		else:
			print("Error: Parsing JSON file failed")
		
	else:
		print("ERROR: File does not exist")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var variant_json = read_json("res://variants/variants.json")
	
	for variant in variant_json:
		var variant_name = variant["Name"]
		var variant_author = variant["Author"]
		
		if variant_author == "Chess":
			variant_author = ""
		else:
			variant_author = str(" by ",variant_author)
		
		var item_name = str(variant_name,variant_author)
		add_item(item_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
