#
#   Follow Owner
#   
#   Purpose: To bring the marker closer to its owner snowball
#
#   Input: None
#

tag @s add bouncyenderpearls.marker.follow_owner.marker
execute as @e[type=snowball,tag=bouncyenderpearls.bouncy] if score @s bouncyenderpearls.uuidlink = @e[tag=bouncyenderpearls.marker.follow_owner.marker,limit=1] bouncyenderpearls.uuidlink run tag @s add bouncyenderpearls.marker.follow_owner.snowball

# If the owner snowball is still kicking around, update the marker
execute if entity @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] run function bouncyenderpearls:logic/snowball/while_flying

# If no snowball is kicking around, instead run through landed logic
execute unless entity @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] run function bouncyenderpearls:logic/snowball/on_land

tag @s remove bouncyenderpearls.marker.follow_owner.marker
tag @e[tag=bouncyenderpearls.marker.follow_owner.snowball,limit=1] remove bouncyenderpearls.marker.follow_owner.snowball
