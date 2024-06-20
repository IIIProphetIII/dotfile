import subprocess
import re

bspc = open("/home/toor/.config/bspwm/bspwmrc")
border = re.search("bspc config border_width \d{1}", bspc.read())
border = re.findall("\d", border.group())[0]
curBorder = subprocess.run(["bspc", "config", "border_width"], capture_output=True)
curBorder = curBorder.stdout.decode("utf-8").rstrip()

if curBorder == "0":
    subprocess.run(["bspc", "config", "border_width", border])
else:
    subprocess.run(["bspc", "config", "border_width", "0"])
