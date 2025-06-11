#
#   Snowball Flying
#   
#   Purpose: To update the marker if the owner snowball still exists
#
#   Input: None
#


# Save motion as the owner snowball's motion (For storage, since markers don't move)
data modify entity @s data.bouncyenderpearls.Motion set from entity @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] Motion
data modify entity @s data.bouncyenderpearls.Rotation set from entity @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] Rotation
execute store result entity @s data.bouncyenderpearls.Rotation[0] double -1 run data get entity @s data.bouncyenderpearls.Rotation[0]
execute store result entity @s data.bouncyenderpearls.Rotation[1] double -1 run data get entity @s data.bouncyenderpearls.Rotation[1]

#tellraw @p {"nbt":"data.bouncyenderpearls.Motion","entity":"@s"}

# Change marker's position to snowball's new position
execute at @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] run tp ~ ~ ~


