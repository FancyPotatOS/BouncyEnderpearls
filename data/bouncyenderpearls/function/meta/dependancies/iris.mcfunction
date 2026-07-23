

execute if data storage iris:settings Blacklist run return 0

function iris:setup/storage

execute if data storage iris:settings Blacklist run return 0

tellraw @a ["",{"text":"[Missing Dependancy]","color":"red"}," - ",{"text":"Bouncy Enderpearls Datapack ","color":"blue"},"(",{"text":"Requires Iris datapack. Consult the Github repository for more information.","italic":true,"color":"dark_aqua"},")"]

