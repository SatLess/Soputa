extends CharacterBody3D

@onready var raycasts: Node3D = $Raycasts

enum  STATES {IDLE,FLEEING}
var cur_state: STATES = STATES.IDLE
