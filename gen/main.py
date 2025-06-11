

import os

def replace_values(string: str, replacements: dict[str, str]):
    for key in [str(x) for x in replacements]:
        string = string.replace(key, replacements[key])
    return string

# Boosted recipes

original = """{
  "type": "minecraft:crafting_shapeless",
  "category": "misc",
  "ingredients": [
    [
      "minecraft:ender_pearl"
    ],_SLIME__RABBIT_
  ],
  "result": {
    "id": "minecraft:snowball",
    "components": {
      "minecraft:custom_model_data": {
        "strings": [
          "bouncyenderpearls:bouncy_enderpearl"
        ]
      },
      "minecraft:custom_name": {
        "text": "Bouncy Enderpearl",
        "italic": false,
        "color": "white"
      },
      "minecraft:lore": [
        [{
          "text": "Bounces: ",
          "color": "gray"
        },
        {
          "bold": true,
          "text": "_BOUNCES_",
          "italic": false
        }],
        [{
          "text": "Recoil: ",
          "color": "gray"
        },
        {
          "bold": true,
          "text": "_MULT_%",
          "italic": false
        }]
      ],
      "enchantment_glint_override": false,
      "enchantments": {
        "bouncyenderpearls:projectile_spawned": 1
      },
      "tooltip_display": {
        "hidden_components": [
          "minecraft:enchantments"
        ]
      },
      "custom_data": {
        "bouncyenderpearls": {
          "is_bouncy": 1,
          "bounce": {
            "count": _BOUNCES_,
            "mult": _MULT_,
            "div": 100
          }
        }
      }
    },
    "count": 1
  }
}"""

slime_ball_str = """
    [
      "minecraft:slime_ball"
    ]"""

rabbit_foot_str = """
    [
      "minecraft:rabbit_foot"
    ]"""

target_dir = "C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_5/datapacks/BouncyEnderpearls - 1.21.5/data/bouncyenderpearls/recipe/"
os.chdir(target_dir)

values = {
    "_BOUNCES_": 1,
    "_MULT_": 95
}
for rabbit in range(0, 9):
    for slime in range(0, 9-rabbit):
        if rabbit == 0 and slime == 0: continue
        values["_RABBIT_"] = ",".join([rabbit_foot_str for _ in range(rabbit)])
        values["_SLIME_"] = ""
        if slime != 0:
            values["_SLIME_"] = ",".join([slime_ball_str for _ in range(slime)])
            if rabbit != 0:
                values["_SLIME_"] = values["_SLIME_"] + ","
        values["_BOUNCES_"] = str(slime)    
        values["_MULT_"] = str(95 + (10*rabbit))

        created = replace_values(original, values)

        with open(f"{rabbit}_{slime}.json", "w") as file:
            file.write(created)


