

# Reduce the bounce count by one
scoreboard players remove @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.count 1

# Sound effect for bounce
execute at @s run playsound block.slime_block.step block @a[distance=..50] ~ ~ ~ 1 1 0.2

# Summon a snowball or enderpearl depending on the bounce data
execute if score @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.count matches 1.. run summon snowball ~ ~ ~ {Tags:[bouncyenderpearls.bouncy,bouncyenderpearls.needs_updating],Item:{id:"minecraft:snowball",count:1b,components:{"minecraft:custom_model_data":{"strings":["bouncyenderpearls:bouncy_enderpearl"]},"minecraft:custom_data":{bouncyenderpearls:{is_bouncy:1b}}}}}
execute if score @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.count matches ..0 run summon ender_pearl ~ ~ ~ {Tags:[bouncyenderpearls.needs_updating],Item:{id:"minecraft:snowball",count:1b,components:{"minecraft:custom_model_data":{"strings":["bouncyenderpearls:bouncy_enderpearl"]},"minecraft:custom_data":{bouncyenderpearls:{is_bouncy:1b}}}}}

# Ray cast
function iris:get_target

#execute unless data storage iris:output {TargetType: "BLOCK"} run say no block
#tellraw @p ["==",{"nbt":"TargetType","storage":"iris:output"},", ", {"nbt":"TargetedFace.Direction","storage":"iris:output"}]

# Save the old motion data
data modify entity @e[tag=bouncyenderpearls.needs_updating,limit=1] Motion set from entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion
data modify entity @e[tag=bouncyenderpearls.needs_updating,limit=1] Rotation set from entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Rotation

# Set motion values, inversing the one that the wall hit (If hit ceiling, inverse the Y Motion value, etc.)
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[0] 10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] unless data storage iris:output {TargetType: "BLOCK"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[0] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "EAST"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[0] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "WEST"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[0] -10000
scoreboard players operation temp bouncyenderpearls.master *= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.mult
scoreboard players operation temp bouncyenderpearls.master /= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.div
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result entity @s Motion[0] double 0.0001 run scoreboard players get temp bouncyenderpearls.master

execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[1] 10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] unless data storage iris:output {TargetType: "BLOCK"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[1] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "UP"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[1] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "DOWN"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[1] -10000
scoreboard players operation temp bouncyenderpearls.master *= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.mult
scoreboard players operation temp bouncyenderpearls.master /= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.div
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result entity @s Motion[1] double 0.0001 run scoreboard players get temp bouncyenderpearls.master

execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[2] 10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] unless data storage iris:output {TargetType: "BLOCK"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[2] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "NORTH"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[2] -10000
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] if data storage iris:output TargetedFace{Direction: "SOUTH"} store result score temp bouncyenderpearls.master run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion[2] -10000
scoreboard players operation temp bouncyenderpearls.master *= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.mult
scoreboard players operation temp bouncyenderpearls.master /= @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.bounce.div
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result entity @s Motion[2] double 0.0001 run scoreboard players get temp bouncyenderpearls.master

# Save the new motion data
data modify entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Motion set from entity @e[tag=bouncyenderpearls.needs_updating,limit=1] Motion

# Flip rotation values, just in case the snowball breaks within a tick
# If we don't do this, then there are cases like: the snowball gets stuck in corners where it keeps flipping an X Motion coordinate while it's technically hitting the Z side, just because the rotation is 'outdated' and can't update in time.
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] at @s run function bouncyenderpearls:logic/snowball/flipping/all


# Save new rotation
data modify entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Rotation set from entity @e[tag=bouncyenderpearls.needs_updating,limit=1] Rotation

#tellraw @p ["==",{"nbt":"Motion","entity":"@e[limit=1,tag=bouncyenderpearls.needs_updating]"}]

# Retrieve and apply ownership data from the marker
data modify entity @e[tag=bouncyenderpearls.needs_updating,limit=1] Owner set from entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] data.bouncyenderpearls.Owner
execute as @e[tag=bouncyenderpearls.needs_updating,limit=1] store result score @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.uuidlink run data get entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] UUID[0]
scoreboard players operation @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1] bouncyenderpearls.uuidlink = @e[tag=bouncyenderpearls.needs_updating,limit=1] bouncyenderpearls.uuidlink

# Unflag the entity as needing value updating
tag @e[tag=bouncyenderpearls.needs_updating] remove bouncyenderpearls.needs_updating

# Kill the marker if all done
execute if entity @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1,scores={bouncyenderpearls.bounce.count=..0}] run return run kill @e[type=marker,tag=bouncyenderpearls.landed.marker,limit=1,scores={bouncyenderpearls.bounce.count=..0}]



return 0
