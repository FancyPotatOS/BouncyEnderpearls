#
#   Tick
#   
#   Purpose: To perform any updates necessary on bouncy-related entites
#
#   Input: None
#


# Provide the endrod effect to help debug
#execute as @e[tag=bouncyenderpearls.riding_marker,type=marker] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1
#execute as @e[type=ender_pearl] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1

# Update the riding markers
execute as @e[type=marker,tag=bouncyenderpearls.riding_marker] at @s run function bouncyenderpearls:logic/marker/follow_owner

