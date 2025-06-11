#
#   Migration File V1
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#

tellraw @a ["",{"text":"[Bouncy Enderpearls Datapack]","bold":true,"color":"dark_blue"}," - Setup"]

# Apply last migration
#execute unless score version bouncyenderpearls.master matches 1.. run function bouncyenderpearls:meta/migrate/migration_v0

# Set this as the latest version number
scoreboard players set version bouncyenderpearls.master 1

scoreboard objectives add bouncyenderpearls.bounce.count dummy
scoreboard objectives add bouncyenderpearls.bounce.mult dummy
scoreboard objectives add bouncyenderpearls.bounce.div dummy

scoreboard objectives add bouncyenderpearls.uuidlink dummy
scoreboard objectives add bouncyenderpearls.temp dummy


return 1
scoreboard objectives add fpconflict.conflict_map dummy
