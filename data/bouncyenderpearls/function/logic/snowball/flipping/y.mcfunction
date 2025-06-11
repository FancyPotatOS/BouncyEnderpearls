

# Check direction
execute unless data storage iris:output TargetedFace{Direction: "UP"} unless data storage iris:output TargetedFace{Direction: "DOWN"} run return 0

# Flip rotation into scoreboard
execute store result score YRotation bouncyenderpearls.master run data get entity @s Rotation[1] -1000000

# Set back into rotation
execute store result entity @s Rotation[1] double 0.000001 run scoreboard players get YRotation bouncyenderpearls.master

