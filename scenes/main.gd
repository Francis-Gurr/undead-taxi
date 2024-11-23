extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var weights = PackedFloat32Array([0, 16, 4, 1])
	for x in range(16):
		for y in range(16):
			var tile = Vector2i(rng.rand_weighted(weights), 0)
			tile_map_layer.set_cell(Vector2i(x, y), 0, tile)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
