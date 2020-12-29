# Drawing-Wrapper
**Synapse X**'s Drawing Library currently does not manage the objects created.
This script wraps the Drawing table, and stores a reference to every draw object created.

#### What I Added
- `Drawing.Length`  - Returns how many drawing objects you created.
- `Drawing.Clear()` - Destroys all of the drawing objects you created.

You can access the table where all the objects are stored as well.

`Drawing.__CONTAINER`

Code example:
```Lua
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Jonathann-0/Drawing-Wrapper/main/main.lua"))() -- place in the beginning of your script

local line = Drawing.new("Line")
line.Visible = true
line.Color = Color3.fromRGB(255, 255, 255)
line.Thickness = 2
line.Transparency = 1
line.From = Vector2.new(300, 300);
line.To = Vector2.new(300, 200);

print(Drawing.Length) -- > 1
wait(1)
Drawing:Clear()
print(Drawing.Length) -- > 0
```

I have included different aliases as well to remove drawing objects.
```lua
line:Remove()
line:Destroy()
line:Delete()
-- All work and are not case sensitive!
```
