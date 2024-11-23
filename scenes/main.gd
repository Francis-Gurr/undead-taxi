extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var car: CharacterBody2D = $Car

var rng = RandomNumberGenerator.new()
const CHUNK_WIDTH = 256
var drawn_chunks = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_chunk: Vector2i = Vector2i(floor(car.position / CHUNK_WIDTH))
	print(car.position, player_chunk)
	if !drawn_chunks.has(str(player_chunk)):
		print("draw new", player_chunk)
		draw_chunk(player_chunk)
		drawn_chunks[str(player_chunk)] = true
	pass


func draw_chunk(chunk: Vector2i) -> void:
	var weights = PackedFloat32Array([0, 16, 4, 1])
	for x in range(16):
		for y in range(16):
			var tile = Vector2i(rng.rand_weighted(weights), 0)
			var tile_x = chunk.x * 16 + x
			var tile_y = chunk.y * 16 + y
			tile_map_layer.set_cell(Vector2i(tile_x, tile_y), 0, tile)
	
	
	
