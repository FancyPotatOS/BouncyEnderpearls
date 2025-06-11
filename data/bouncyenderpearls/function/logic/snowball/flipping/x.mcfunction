

# Check direction
execute unless data storage iris:output TargetedFace{Direction: "EAST"} unless data storage iris:output TargetedFace{Direction: "WEST"} run return 0

#say flip X
#tellraw @p ["==",{"nbt":"Rotation[0]","entity":"@s"}]

# Get inverted rotation
execute store result score HorizontalRotationFirst bouncyenderpearls.master run data get entity @s Rotation[0] -1000000

# This scoreboard middleman is necessary, because for some reason if you 'execute store' directly from the 'data get' command, it rounds as an int!!

# Assign to rotation
execute store result entity @s Rotation[0] double 0.000001 run scoreboard players get HorizontalRotationFirst bouncyenderpearls.master

#tellraw @p ["==",{"nbt":"Rotation[0]","entity":"@s"}]