

summon minecraft:armor_stand ~ ~ ~ {Tags:["bouncyenderpearls.landed.raycaster"],Invisible:1b,NoGravity:1b,NoAI:1b,Invulnerable:1b}
data modify entity @e[type=armor_stand,limit=1,tag=bouncyenderpearls.landed.raycaster] Rotation set from entity @s data.bouncyenderpearls.Rotation

tag @s add bouncyenderpearls.landed.marker

execute as @e[type=armor_stand,limit=1,tag=bouncyenderpearls.landed.raycaster] at @s rotated as @s run function bouncyenderpearls:logic/snowball/armor_stand_bounce
kill @e[type=minecraft:armor_stand,tag=bouncyenderpearls.landed.raycaster]
return 0

