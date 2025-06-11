#
#   Bouncy Enderpearl Initialize
#   
#   Purpose: To initialize the state of the bouncy enderpearl
#
#   Input: None
#


tag @s add bouncyenderpearls.bouncy

# Summon marker to track snowball
summon minecraft:marker ~ ~ ~ {Tags:[bouncyenderpearls.riding_marker,bouncyenderpearls.riding_marker.new]}

# Set scoreboard values from the snowball's item
execute store result score @e[type=marker,tag=bouncyenderpearls.riding_marker.new] bouncyenderpearls.bounce.count run data get entity @s Item.components."minecraft:custom_data".bouncyenderpearls.bounce.count
execute store result score @e[type=marker,tag=bouncyenderpearls.riding_marker.new] bouncyenderpearls.bounce.div run data get entity @s Item.components."minecraft:custom_data".bouncyenderpearls.bounce.div
execute store result score @e[type=marker,tag=bouncyenderpearls.riding_marker.new] bouncyenderpearls.bounce.mult run data get entity @s Item.components."minecraft:custom_data".bouncyenderpearls.bounce.mult

# Save owner by UUID in scoreboard
# Note that the snowball has its UUID stored, but the marker has the owner snowball's UUID stored
execute store result score @s bouncyenderpearls.uuidlink run data get entity @s UUID[0]
scoreboard players operation @e[type=marker,tag=bouncyenderpearls.riding_marker.new] bouncyenderpearls.uuidlink = @s bouncyenderpearls.uuidlink
data modify entity @e[type=marker,tag=bouncyenderpearls.riding_marker.new,limit=1] data.bouncyenderpearls.Owner set from entity @s Owner

# Remove new flag
tag @e[tag=bouncyenderpearls.riding_marker.new] remove bouncyenderpearls.riding_marker.new


