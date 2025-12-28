An open source extension for environment funcitons.

Put this in your autoexec:
loadstring(isfile("MoreLibrary/init.lua") and readfile("MoreLibrary/init.lua") or game:HttpGet("https://raw.githubusercontent.com/Sleve-m/More-Library/refs/heads/main/init.lua"))()

Put this in your script before any MoreLibrary functions are called:
local morelibraryloadsuccess = nil
if not getgenv().MoreLibraryLoaded then
  local starttime = os.clock()
  while wait(0.1) do
    if getgenv().MoreLibraryLoaded then morelibraryloadsuccess = true; break end
    if (os.clock()-starttime) > 10 then morelibraryloadsuccess = false; break end
  end
end


If you have any issues, please contact me on discord, my tag is sleve


Documentation: (112 functions)

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Math v1.0.0a: (15 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

math.odd(x)
math.odd(5) -> true
Returns true if the number is odd.

math.even(x)
math.even(4) -> true
Returns true if the number is even.

math.chance(x)
math.chance(25) -> (true 25% of the time)
Returns true x% of the time.

math.randomfloat(min, max)
math.randomfloat(0, 10) -> 4.037757843207314
Returns a random float between two values.

math.map(x, start, stop, newStart, newStop)
math.map(50, 0, 100, 0, 1) -> 0.5
Converts a number from one rage to another.

math.roundto(x, place)
math.roundto(1.5678, 2) -> 1.56
Rounds to x decimal places.

math.approx(a, b, epsilon)
math.approx(1, 0.999999) -> true
math.approx(1, 0.9, 0.1) -> true
Checks if two numbers are close enough to be considered equal.

math.inverselerp(a, b, value)
math.inverselerp(0, 10, 2) -> 0.2
Returns the percentage of the way through the range(a-b) the value is.

math.smoothstep(a, b, t)
math.smoothstep(1, 10, 5) -> 0.4170096021947874
Returns a smooth value (0-1). Used for non-linear movement.

math.lerpangle(start, goal, alpha)
math.lerpangle(350, 10, 0.5) -> 0 (or 360)
Linearly interpolates between two angles, automatically taking the shortest path (handling the 360/0 crossover).

math.deltangle(current, target)
math.deltaangle(350, 10) -> 20
Calculates the shortest difference in degrees between two angles. Positive means turn right, negative means turn left.

math.snap(x, step)
math.snap(1.23, 0.5) -> 1.0
math.snap(1.26, 0.5) -> 1.5
Rounds a number to the nearest multiple of the step size (grid snapping).

math.wrap(value, min, max)
math.wrap(11, 0, 10) -> 1
math.wrap(-1, 0, 10) -> 9
Wraps a value within a range. If it exceeds the max, it loops back to the min (like Pac-Man going off-screen).

math.pingpong(t, length)
math.pingpong(12, 10) -> 8
Oscillates a value back and forth between 0 and length based on time t.

math.quadraticbezier(t, p0, p1, p2)
math.quadraticbezier(0.5, start, control, end) -> (Point on curve)
Calculates a position on a curve defined by a start point, a control point (influence), and an end point.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More String v1.0.0a: (23 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

string.append(str, toappend)
string.append("Text", "More text") -> "TextMore text"
Appends to a string. Replaces: myString = myString .. appendText

string.split(str, separator)
string.split("one,two,three", ",") -> {"one", "two", "three"}
Splits a string into a table based on the separator. Defaults to space if no separator is provided.

string.startswith(str, prefix)
string.startswith("/e dance", "/e") -> true
Returns true if the string begins with the specified prefix.

string.endswith(str, suffix)
string.endswith("file.txt", ".txt") -> true
Returns true if the string ends with the specified suffix.

string.contains(str, sub)
string.contains("Hello World", "World") -> true
Returns true if the substring exists anywhere inside the string.

string.capitalize(str)
string.capitalize("roblox") -> "Roblox"
Forces the first character to uppercase and the rest to lowercase.

string.title(str)
string.title("welcome to the jungle") -> "Welcome To The Jungle"
Capitalizes the first letter of every word in the string.

string.prettynumber(n: number)
string.prettynumber(1000000) -> "1,000,000"
Formats a number (or string number) with commas for thousands separators.

shortennumber(n: number, customprefixes: table)
shortennumber(1500) -> "1.5k"
Default prefixs = { "k", "M", "B", "T", "q", "Q", "s", "S", "O", "N", "D"}
Abbreviates large numbers.

string.pad(str, length, char)
string.pad("5": string, 3: number, "0": string) -> "005"
Adds characters to the left side of the string until it reaches the specified length.

string.random(length)
string.random(10) -> "x8kL2m9Pq1"
Generates a random alphanumeric string of the specified length. Useful for unique IDs or obfuscation.

string.shuffle(str)
string.shuffle("password") -> "swrodpap"
Randomizes the order of characters in the string.

string.totable(str)
string.totable("abc") -> {"a", "b", "c"}
Explodes a string into an array containing each individual character.

string.escape(str)
string.escape("User [123]") -> "User %[123%]"
Escapes Lua "magic characters" (like . [ ( %) so the string can be used safely in pattern matching.

string.striptags(str)
string.striptags("<font color='red'>Error</font>") -> "Error"
Removes all XML-like tags from a string, leaving only the raw text.

string.color(str, hex)
string.color("Hello", "#FF0000") -> "<font color="#FF0000">Hello</font>"
Wraps the text in a RichText font color tag.

string.size(str, size)
string.size("Hello", 30) -> "<font size="30">Hello</font>"
Wraps the text in a RichText size tag.

string.bold(str)
string.bold("Hello") -> "<b>Hello</b>"
Wraps the text in bold tags.

string.italic(str)
string.italic("Hello") -> "<i>Hello</i>"
Wraps the text in italic tags.

string.underline(str)
string.underline("Hello") -> "<u>Hello</u>"
Wraps the text in underline tags.

string.strike(str)
string.strike("Hello") -> "<s>Hello</s>"
Wraps the text in strikethrough tags.

string.tag(str, tagName, attributes)
string.tag("Text", "font", { face="Arial" } ) -> "<font face="Arial">Text</font>"
Wraps text in a custom XML tag with optional attributes.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Table v1.0.0a: (27 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

table.keys(t)
table.keys({a=1, b=2}) -> {"a", "b"}
Returns a list of all keys in a dictionary.

table.values(t)
table.values({a=1, b=2}) -> {1, 2}
Returns a list of all values in a dictionary.

table.count(t)
table.count({a=1, b=2}) -> 2
Counts elements in a dictionary (since #t only works on arrays).

table.deepcount(t)
Does the same as table.count but also for nested values.

table.merge(target, source)
table.merge({A=1}, {B=2}) -> {A=1, B=2}
Combines two tables. Keys in the source overwrite the target.

table.deepcopy(t)
Creates a full recursive copy of a table, ensuring nested tables are also copied independently.

table.reverse(t)
table.reverse({1, 2, 3}) -> {3, 2, 1}
Reverses the order of an array.

table.shuffle(t)
table.shuffle({1, 2, 3}) -> {3, 1, 2}
Randomizes the order of an array.

table.random(t)
table.random({1, 2, 3}) -> 2
Returns a random element from the array.

table.unique(t)
table.unique({1, 1, 2}) -> {1, 2}
Removes duplicate values from an array.

table.flatten(t)
table.flatten({{1}, {2}}) -> {1, 2}
Converts a nested table into a single flat list.

table.slice(t, start: number, stop: number)
table.slice({1,2,3,4}, 2, 3) -> {2, 3}
Returns a specific section of an array.

table.map(t, func)
table.filter({ "H", "E", "L", "L", "O" }, function(i, v) return v=="L" end) -> { false, false, true, true, false}
Runs a function on every item and returns the new results.

table.filter(t, func)
table.filter({ "H", "E", "L", "L", "O" }, function(i, v) return v=="L" end) -> { "L", "L" }
Returns a new table containing only items that return true in the function.

table.some(t, func)
table.some({ "H", "E", "L", "L", "O" }, function(i, v) return v=="L" end) -> true
Returns true if at least one item passes the check.

table.every(t, func)
table.every({ "H", "E", "L", "L", "O" }, function(i, v) return v=="L" end) -> false
Returns true if all items pass the check.

table.fordo(t, func)
table.fordo({ "H", "E", "L", "L", "O" }, function(i, v) print(v=="L") end) ->
false
false
true
true
false
Performs a function on each value of the table.
Passes arguments to the function as (key, value, table)

table.sortalphabetical(t)
table.sortalphabetical( { "x", "A", "c", "a" } ) -> { "A", "a", "c", "x" }
Sorts strings A-Z (Case-Insensitive).

table.sortnumerical(t)
table.sortnumerical( { 5, 2, 1, 4 } ) -> { 1, 2, 4, 5 }
Sorts numbers Smallest -> Biggest.

table.sortdesc(t)
table.sortnumerical( { 5, 2, 1, 4 } ) -> { 5, 4, 2, 1 }
Sorts numbers/strings Biggest -> Smallest (Descending).

table.sortnatural(t)
table.sortnatural( { "x", "3", "a", "1" } ) -> { "1", "3", "a", "x" }
Sorts mixed strings in natural order

table.sortby(t, property)
Sorts a list of tables/objects by a specific property key.

table.replace(t, target, replacement)
Finds values in a list and replaces them with another value.
table.replace({ "a", "b", "c" }, "b", "x")
Returns:
{ "a", "x", "c" }

table.deepreplace(t, target, replacement)
Does what table.replace does but also within nested tables.
table.deepreplace({ 1, 2, { 3, 4, 5 } }, 4, "a")
Returns:
{ 1, 2, { 3, "a", 5 } }

table.flatstring(t)
Returns a string value for visualizing tables.
table.flatstring({ "Names", "are", { "John", "Susie" } })
Returns:
"[1] = Names,
[2] = are,
[3][1] = John,
[3][2] = Susie"

table.deepstring(t)
Returns a string value for visualizing tables.
table.deepstring( { "Names", "are", { "John", "Susie" } } )
Returns:
"{
	[1] = Names,
	[2] = are,
	[3] = {
		[1] = John,
		[2] = Susie
	}
}"

table.concat(t, separator: string)
Returns a string of the table contents concatenated together.
table.concat( {"H","E","L","L","O"}, "-" )
Returns:
"H-E-L-L-O"

table.deepconcat(t, separator: string, newline: boolean)
Does what table.concat does but also within nested tables. (With a boolean option to start a new line using \n on nested table.)
table.deepconcat( { "H", "E", { "L", "L", "O" } }, ".", true)
Returns:
"H.E
L.L.O"

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Color v1.0.0a: (12 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

Color3.tohex(color)
Color3.tohex(Color3.fromRGB(255, 255, 255)) -> "#FFFFFF"
Converts a Color3 object back into a Hex string. Useful for saving user configurations to a file.

Color3.getluminance(color)
Color3.getluminance(Color3.new(1, 1, 1)) -> 1.0
Calculates the perceived brightness of a color on a scale of 0 to 1 based on human eye sensitivity.

Color3.darken(color, amount)
Color3.darken(Color3.new(1, 0, 0), 0.1) -> [Darker Red]
Returns a new color that is darker by the specified amount (0-1). Useful for button hover states.

Color3.lighten(color, amount)
Color3.lighten(Color3.new(0, 0, 0), 0.2) -> [Dark Grey]
Returns a new color that is lighter by the specified amount (0-1).

Color3.desaturate(color, amount)
Color3.desaturate(Color3.new(1, 0, 0), 0.5) -> [Pastel Red]
Reduces the saturation (vividness) of a color, making it look more "washed out."

Color3.grayscale(color)
Color3.grayscale(Color3.new(1, 0, 0)) -> [Grey]
Converts a color to black and white while preserving its perceived brightness. Great for "Disabled" UI states.

Color3.invert(color)
Color3.invert(Color3.new(1, 1, 1)) -> [Black]
Returns the mathematical opposite of the given color.

Color3.random() Color3.random() -> [Random Vivid Color]
Returns a random color with full saturation and brightness.

Color3.blend(c1, c2, alpha)
Color3.blend(red, blue, 0.5) -> [Purple]
Linearly interpolates (mixes) two colors based on the alpha (0-1).

Color3.contrast(color)
Color3.contrast(Color3.new(1, 1, 0)) -> [Black]
Returns either Black or White, depending on which one is more readable on top of the input color. Essential for text on dynamic backgrounds.

Color3.isbright(color)
Color3.isBright(Color3.new(0, 0, 0)) -> false
Returns true if the color is considered visually bright, and false if it is dark.

Color3.complementary(color)
Color3.complementary(Color3.new(1, 0, 0)) -> [Cyan]
Returns the color located directly opposite on the color wheel. Used for finding accent colors.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More UI v1.0.0a: (2 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

moreUI.makedraggable(handle: interactable ui instance, smoothing: number (default = 0), target: (optional) ui instance (default = handle))
Makes ui draggable with an optional target.
handle: The element the user clicks and holds (e.g., the title bar)
target: The element that actually changes position (e.g., the main window)

moreUI.smoothscroll(frame: scrollingframe, options: table(optional))
default options -> { 
  speed = 3: number, 
  friction = 0.93: number, 
  speedscroll = { 
    active = true: boolean, 
    speed = 8: number, 
    control = "LeftShift": string 
  },
  sidescroll = { 
    active = true: boolean, 
    inverted = true: boolean, 
    control = "LeftControl": string 
  },
  autoscroll = { 
    active = true: boolean, 
    image = getcustomasset("MoreLibrary/Images/autoscroll.png"): image,
    sensitivity = : number,
    deadzonesize = : number,
    control = "MouseButton3": string
  }
}
Makes scrolling frames scrolling smooth and adds extra controls:
Speed scroll: Increases speed for faster scrolling.
Side scroll: For scrolling sideways without having to drag the scroll bar.
Auto scroll: For scrolling(in y and x) using the mouse position in relation to a starting point(where the control was activated).

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Object v1.0.0a: (1 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

Object.modify(inst: Instance, properties: table)
Sets given properties(keys) to values. Useful for 
Example: Object.modify(myTextLabel, {
  Text = "Hello",
  BackgroundTransparency = 1
})

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Input v1.0.0a: (8 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------
Uses game:GetService("UserInputService") or UserInputService(from More Services)

UserInputService.iskeydown(key) -> bool
Example: if UserInputService.iskeydown("LeftShift") then ... end

UserInputService.isbuttondown(button) -> bool
Example: if UserInputService.isbuttondown("MouseButton2") then ... end

UserInputService.iscombo(key1, key2) -> bool
Returns true ONLY if both keys are held down.
Example: if UserInputService.iscombo("LeftControl", "C") then print("Copied!") end

UserInputService.onpress(key, callback) -> Connection
Runs the function once per press.
Example: UserInputService.onpress("Q", function() print("Q pressed") end)

UserInputService.ontoggle(key, callback(state)) -> Connection
Toggles an internal boolean on/off and runs the callback with the new state.
Example: 
UserInputService.ontoggle("P", function(enabled) 
    print("Aimbot is now:", enabled) 
end)

UserInputService.waitforkey(key) -> void
Pauses the script execution until the user presses the specific key.
Example: 
print("Press K to start...")
UserInputService.waitforkey("K")
print("Started!")

UserInputService.getmousepos() -> Vector2
Example: local pos = UserInputService.getmousepos()

UserInputService.iswindowactive() -> bool
Example: if not UserInputService.iswindowactive() then return end

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More io v1.0.0a: (10 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

io.writetabletofile(path: string, data: table) -> bool
Serializes a Lua table to JSON and saves it. Automatically creates missing folders.
Example: io.writetabletofile("Configs/settings.json", {Speed = 16})

io.loadtablefromfile(path: string) -> table | nil
Loads a JSON file and converts it to a Lua table. Returns nil if file missing/bad.
Example: local data = io.loadtablefromfile("Configs/settings.json")

io.requirefile(path: string) -> any
Loads and runs a local Lua file (like 'require' but for files).
Example: local lib = io.requirefile("Libs/MyLib.lua")

io.safewritefile(path: string, content: string) -> void
Writes a string to a file, ensuring the folder exists first.
Example: io.safewritefile("Logs/log.txt", "Started")

io.getfilesrecursive(folder: string) -> table
Returns a list of all file paths in a folder AND its subfolders.
Example: local files = io.getfilesrecursive("Scripts")

io.wipefolder(folder: string) -> void
Recursively deletes a folder and ALL contents (fixes 'delfolder' errors).
Example: io.wipefolder("Cache")

io.copyfile(source: string, dest: string) -> bool
Copies a file from source to dest. Auto-creates dest folder.
Example: io.copyfile("config.json", "config.backup")

io.movefile(source: string, dest: string) -> bool
Moves a file from source to dest (Copy + Delete).
Example: io.movefile("temp.lua", "real.lua")

io.downloadfile(path: string, url: string) -> bool
Downloads content from a URL and saves it to a file.
Example: io.downloadfile("image.png", "https://example.com/img.png")

io.appendfilewithlog(path: string, text: string) -> void
Appends text to a file with a timestamp [YYYY-MM-DD HH:MM:SS].
Example: io.appendfilewithlog("debug.log", "Script executed")

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Drawing v1.0.0a: (8 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

Drawing.drawtriangle(p1, p2, p3, color, filled) -> Triangle
Draws a triangle between three Vector2 points.
Example: Drawing.drawtriangle(Vector2.new(100,100), Vector2.new(150,200), Vector2.new(50,200))

Drawing.drawquad(p1, p2, p3, p4, color, filled) -> Quad
Draws a 4-point polygon (essential for 3D boxes).
Example: Drawing.drawquad(v2_TopLeft, v2_TopRight, v2_BotRight, v2_BotLeft)

Drawing.drawcircle(pos: Vector2, radius: number, color: Color3, filled: bool) -> Circle
Creates a circle.
Example: local c = Drawing.drawcircle(Vector2.new(500,500), 50, Color3.new(0,1,0), true)

Drawing.drawtext(pos: Vector2, text: string, color: Color3, size: number, center: bool) -> Text
Creates text with an outline (for readability).
Example: local t = Drawing.drawtext(Vector2.new(100,100), "Enemy", Color3.new(1,1,1), 20)

Drawing.drawsquare(pos: Vector2, size: Vector2, color: Color3, filled: bool) -> Square
Creates a square/rectangle.
Example: local s = Drawing.drawsquare(Vector2.new(100,100), Vector2.new(50,50), Color3.new(1,0,0))

Drawing.drawimage(pos, raw_data, size) -> Image
Draws an image from raw file data.
Example: Drawing.drawimage(Vector2.new(100,100), readfile("my_icon.png"), Vector2.new(32,32))

Drawing.getscreencenter() -> Vector2
Returns the exact center of the screen (useful for crosshairs or FOV circles).
Example: local circle = Drawing.drawcircle(Drawing.getscreencenter(), 100, Color3.new(1,1,1))

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Request v1.0.0a: (5 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

(Both request. and http_request. work)

request.simpleget(url: string) -> string | nil
A wrapper for game:HttpGet. Returns the raw body string or nil on failure.
Example: local rawHtml = request.simpleget("https://google.com")

request.simplerequest(url: string, method: string, headers: table, body: string) -> table
Sends a raw HTTP request. Method defaults to "GET".
Returns a table containing {Success, StatusCode, Body, Headers}.
Example: 
local res = request.simplerequest("https://example.com", "POST", {}, "raw_data")
print(res.StatusCode)

request.jsonrequest(url: string, method: string, data: table) -> table | nil
Automatically JSON encodes the 'data' table, sends it with the correct headers,
and attempts to JSON decode the response.
Example: 
local response = request.jsonrequest("https://api.mygame.com/save", "POST", {Score = 100})
print(response.Success)

request.sendwebhook(url: string, payload: string | table) -> void
Quickly sends a message to a Discord webhook. 
Accepts a simple string (message content) OR a table (for embeds/username/avatar).
Example (Simple): request.sendwebhook("https://discord.com/api/...", "Hello World!")
Example (Complex): request.sendwebhook("url", { content = "Hi", username = "Bot" })

request.downloadrepo(owner: string, repo: string, branch: string, target_folder: string)
Downloads a github repo to a target folder. Overwrites if folder already exists to allow updating.
Example:
request.downloadrepo("Sleve-m", "More-Library", "main", "MoreLibrary")

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Debug v1.0.0a: (4 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

debug.benchmark(name: string, func: function, iterations: int(optional)) -> total time: number, average time: number
Runs a function multiple times and returns how long it took in seconds.
Great for checking if your code is lagging the game.
Example: 
local totaltime, avgtime = debug.benchmark(function() 
    for i=1,1000 do math.sqrt(i) end 
end, 100)

debug.getfps() -> number
Returns the current Frames Per Second.
Example:
if debug.getfps() < 30 then print("Lagging!") end

debug.getping() -> number
Returns the current network ping in milliseconds.
Example:
if debug.ping() > 100 then print("High latency!") end

debug.getmemory() -> number
Returns the current memory usage of the Roblox client in Megabytes.
Example: log("RAM Used: " .. debug.getmemory() .. "MB")

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Services v1.0.0a: (3 linking variabls)
-----------------------------------------------------------------------
-----------------------------------------------------------------------