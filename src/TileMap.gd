extends TileMap


const BASE_FLOOR_ID = 0
const BASE_WALL_ID = 1


func setWalls(wallType : int) -> void:
	_updateTiles(BASE_WALL_ID, "wall_", wallType)


func setFloor(floorType : int) -> void:
	_updateTiles(BASE_FLOOR_ID, "floor_", floorType)


func _updateTiles(baseTileID: int, tileType: String, tileTypeID: int) -> void:
	var tileID := tile_set.find_tile_by_name(tileType + str(tileTypeID))
	for tile in get_used_cells_by_id(baseTileID):
		set_cellv(tile, tileID)
