

# Check direction
execute unless data storage iris:output TargetedFace{Direction: "NORTH"} unless data storage iris:output TargetedFace{Direction: "SOUTH"} run return 0

#say flip Z
#tellraw @p ["==",{"nbt":"Rotation[0]","entity":"@s"}]

# Variables
scoreboard players set HorizontalRotationSecond bouncyenderpearls.master 0
scoreboard players set -1 bouncyenderpearls.master -1

# Get rotation
execute store result score HorizontalRotationFirst bouncyenderpearls.master run data get entity @s Rotation[0] 1000000

# Subtract from 180 degrees
scoreboard players set HorizontalRotationSecond bouncyenderpearls.master 180000000
scoreboard players operation HorizontalRotationSecond bouncyenderpearls.master -= HorizontalRotationFirst bouncyenderpearls.master

# Assign to rotation
execute store result entity @s Rotation[0] double 0.000001 run scoreboard players get HorizontalRotationSecond bouncyenderpearls.master

#tellraw @p ["==",{"nbt":"Rotation[0]","entity":"@s"}]