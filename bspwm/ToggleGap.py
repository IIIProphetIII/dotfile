import subprocess
import re

bspc = open("/home/toor/.config/bspwm/bspwmrc")
gap = re.search("bspc config window_gap \d{1}", bspc.read())
gap = re.findall("\d{1}", gap.group())[0]

curGap = subprocess.run(["bspc", "config", "window_gap"],capture_output=True)
curGap = curGap.stdout.decode("utf-8").rstrip()

if curGap == "0":
    subprocess.run(["bspc", "config", "window_gap", gap])
    # subprocess.run(["bspc", "config", "bottom_padding", "7"])
else:
    subprocess.run(["bspc", "config", "window_gap", "0"])
    # subprocess.run(["bspc", "config", "bottom_padding", "0"])
