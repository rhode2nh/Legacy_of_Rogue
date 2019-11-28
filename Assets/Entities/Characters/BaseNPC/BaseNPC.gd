"""All NPCs will inherit the attributes of this class."""

extends Area2D

export var health = 100

func take_damage(var damage):
	health -= damage