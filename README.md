# Screen-Space-Decals
Realtime screen-space decals for Godot 3.x

![Screen Space Decal](https://raw.githubusercontent.com/Mr-Slurpy/Screen-Space-Decals/master/icon.png)

## Animated Decals

Eventually I may add built-in support for animations but for now you have two ways of doing it:

 - Update the decal with a new texture each frame.
 - Put all the texture frames in one texture and animate the uv to point to the correct texture.

## Known Limitations

 - The decal will render from behind as well. (I may fix this at some point)
 - The decal doesn't actually interact with light, instead it gets the luminosity of the background and does its best to blend in. In practice I haven't had any problems with this yet. If you don't need/want lighting you can turn it off.
