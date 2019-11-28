extends Node

var currentLevel : int
var nextLevel : int

var levelInfo = {
		"unlocked": false,
		"completed": false,
		"path": ""
	}

var levels := {
	1: {
		"unlocked": true,
		"completed": false,
		"path": "res://src/levels/Level_1.tscn"
	},
	2: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_2.tscn"
	},
	3: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_3.tscn"
	},
	4: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_4.tscn"
	},
	5: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_5.tscn"
	},
	6: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_6.tscn"
	},
	7: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_7.tscn"
	},
	8: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_8.tscn"
	},
	9: {
		"unlocked": false,
		"completed": false,
		"path": "res://src/levels/Level_9.tscn"
	},
	10: {
		"unlocked": true,
		"completed": false,
		"path": "res://src/levels/Level_10.tscn"
	}
}


func unlockNextLevel(level : int = currentLevel) -> void:
	if levels.has(level + 1):
		levels[level + 1]["unlocked"] = true