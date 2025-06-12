
import PIL.Image as Image
import random as rng
import os

os.chdir("gen")


# https://www.blog.pythonlibrary.org/2021/06/23/creating-an-animated-gif-with-python/
def make_gif(frames: list[Image.Image], file: str, duration=1500):
    frame_one = frames[0]
    frame_one.save(file, format="GIF", append_images=frames,
               save_all=True, duration=duration, loop=0)
    

starting_pos = (32, 68)
delta_grid = (72, 72)
size = (64, 64)

slimeballs = 1
rabbits_feet = 0

ender_pearl_image = Image.open("ender_pearl.png").convert("RGBA")
slimeball_image = Image.open("slimeball.png").convert("RGBA")
rabbits_foot_image = Image.open("rabbits_foot.png").convert("RGBA")

base_image_path = "base_1s0f.png"

if not os.path.exists("gifs"):
    os.mkdir("gifs")

base_image = Image.open(base_image_path).convert("RGBA")
frames = []
for i in range(30):
    positions = [(x * delta_grid[0] + starting_pos[0], y * delta_grid[1] + starting_pos[1]) for x in range(0, 3) for y in range(0, 3)]

    base_image_instance = base_image.copy()
    
    # Place an enderpearl
    position = rng.choice(positions)
    positions.remove(position)
    Image.Image.paste(base_image_instance, ender_pearl_image, position)
    
    # Place slimeballs
    for _ in range(slimeballs):#rng.choice(slimeballs)):
        position = rng.choice(positions)
        positions.remove(position)

        Image.Image.paste(base_image_instance, slimeball_image, position)
    
    # Place rabbits feet
    for _ in range(rabbits_feet):#rng.choice(rabbits_feet)):
        position = rng.choice(positions)
        positions.remove(position)

        Image.Image.paste(base_image_instance, rabbits_foot_image, position)
    
    frames.append(base_image_instance)

make_gif(frames, f"gifs/{slimeballs}S{rabbits_feet}R.gif")





