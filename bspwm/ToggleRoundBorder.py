with open("/home/toor/.config/picom.conf", "r+") as f:
    old = f.read()
    if old[0] != "#":
        f.seek(0)
        f.write("#"+old)
    else:
        f.seek(0)
        f.write(old[1:])
