An open source extension for environment funcitons

If you have any issues, please contact me on discord, my tag is sleve

How to use:
1. Download all files through github and put the folder in your executor workspace. 
2. Move init.lua to your autoexecutor folder
3. Enjoy :)

Documentation: (99 functions)

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Math: (15 functions)
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

math.randomFloat(min, max)
math.randomFloat(0, 10) -> 4.037757843207314
Returns a random float between two values.

math.map(x, start, stop, newStart, newStop)
math.map(50, 0, 100, 0, 1) -> 0.5
Converts a number from one rage to another.

math.roundTo(x, place)
math.roundTo(1.5678, 2) -> 1.56
Rounds to x decimal places.

math.approx(a, b, epsilon)
math.approx(1, 0.999999) -> true
math.approx(1, 0.9, 0.1) -> true
Checks if two numbers are close enough to be considered equal.

math.inverseLerp(a, b, value)
math.inverseLerp(0, 10, 2) -> 0.2
Returns the percentage of the way through the range(a-b) the value is.

math.smoothstep(a, b, t)
math.smoothstep(1, 10, 5) -> 0.4170096021947874
Returns a smooth value (0-1). Used for non-linear movement.

math.lerpAngle(start, goal, alpha)
math.lerpAngle(350, 10, 0.5) -> 0 (or 360)
Linearly interpolates between two angles, automatically taking the shortest path (handling the 360/0 crossover).

math.deltaAngle(current, target)
math.deltaAngle(350, 10) -> 20
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

math.quadraticBezier(t, p0, p1, p2)
math.quadraticBezier(0.5, start, control, end) -> (Point on curve)
Calculates a position on a curve defined by a start point, a control point (influence), and an end point.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More String: (22 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

string.split(str, separator)
string.split("one,two,three", ",") -> {"one", "two", "three"}
Splits a string into a table based on the separator. Defaults to space if no separator is provided.

string.trim(str)
string.trim(" hello ") -> "hello"
Removes whitespace from the start and end of the string.

string.startsWith(str, prefix)
string.startsWith("/e dance", "/e") -> true
Returns true if the string begins with the specified prefix.

string.endsWith(str, suffix)
string.endsWith("file.txt", ".txt") -> true
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

string.prettyNumber(n)
string.prettyNumber(1000000) -> "1,000,000"
Formats a number (or string number) with commas for thousands separators.

shortennumber(n: number)
shortennumber(1500) -> "1.5k"
Abbreviates large numbers.

string.pad(str, length, char)
string.pad("5", 3, "0") -> "005"
Adds characters to the left side of the string until it reaches the specified length.

string.random(length)
string.random(10) -> "x8kL2m9Pq1"
Generates a random alphanumeric string of the specified length. Useful for unique IDs or obfuscation.

string.shuffle(str)
string.shuffle("password") -> "swrodpap"
Randomizes the order of characters in the string.

string.toTable(str)
string.toTable("abc") -> {"a", "b", "c"}
Explodes a string into an array containing each individual character.

string.escape(str)
string.escape("User [123]") -> "User %[123%]"
Escapes Lua "magic characters" (like . [ ( %) so the string can be used safely in pattern matching.

string.stripTags(str)
string.stripTags("<font color='red'>Error</font>") -> "Error"
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
string.tag("Text", "font", {face="Arial"}) -> "<font face="Arial">Text</font>"
Wraps text in a custom XML tag with optional attributes.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Table: (20 functions)
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

table.merge(target, source)
table.merge({A=1}, {B=2}) -> {A=1, B=2}
Combines two tables. Keys in the source overwrite the target.

table.deepCopy(t)
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

table.slice(t, start, stop)
table.slice({1,2,3,4}, 2, 3) -> {2, 3}
Returns a specific section of an array.

table.map(t, func)
Runs a function on every item and returns the new results.

table.filter(t, func)
Returns a new table containing only items that return true in the function.

table.some(t, func)
Returns true if at least one item passes the check.

table.every(t, func)
Returns true if all items pass the check.

table.sortAlphabetical(t)
Sorts strings A-Z (Case-Insensitive).

table.sortNumerical(t)
Sorts numbers Smallest -> Biggest.

table.sortDesc(t)
Sorts numbers/strings Biggest -> Smallest (Descending).

table.sortNatural(t)
Sorts mixed strings ("Item 1", "Item 10", "Item 2") in human order -> 1, 2, 10.

table.sortBy(t, property)
Sorts a list of tables/objects by a specific property key.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Color: (12 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

Color3.toHex(color)
Color3.toHex(Color3.fromRGB(255, 255, 255)) -> "#FFFFFF"
Converts a Color3 object back into a Hex string. Useful for saving user configurations to a file.

Color3.getLuminance(color)
Color3.getLuminance(Color3.new(1, 1, 1)) -> 1.0
Calculates the perceived brightness of a color on a scale of 0 to 1 based on human eye sensitivity.

Manipulation (Light/Dark)
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

Utility & Theming
Color3.random() Color3.random() -> [Random Vivid Color]
Returns a random color with full saturation and brightness.

Color3.blend(c1, c2, alpha)
Color3.blend(red, blue, 0.5) -> [Purple]
Linearly interpolates (mixes) two colors based on the alpha (0-1).

Color3.contrast(color)
Color3.contrast(Color3.new(1, 1, 0)) -> [Black]
Returns either Black or White, depending on which one is more readable on top of the input color. Essential for text on dynamic backgrounds.

Color3.isBright(color)
Color3.isBright(Color3.new(0, 0, 0)) -> false
Returns true if the color is considered visually bright, and false if it is dark.

Color3.complementary(color)
Color3.complementary(Color3.new(1, 0, 0)) -> [Cyan]
Returns the color located directly opposite on the color wheel. Used for finding accent colors.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Input: (8 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

iskeydown(key) -> bool
Example: if iskeydown("LeftShift") then ... end

isbuttondown(button) -> bool
Example: if isbuttondown("MouseButton2") then ... end

iscombo(key1, key2) -> bool
Returns true ONLY if both keys are held down.
Example: if iscombo("LeftControl", "C") then print("Copied!") end

onpress(key, callback) -> Connection
Runs the function once per press.
Example: onpress("Q", function() print("Q pressed") end)

ontoggle(key, callback(state)) -> Connection
Toggles an internal boolean on/off and runs the callback with the new state.
Example: 
ontoggle("P", function(enabled) 
    print("Aimbot is now:", enabled) 
end)

waitforkey(key) -> void
Pauses the script execution until the user presses the specific key.
Example: 
print("Press K to start...")
waitforkey("K")
print("Started!")

getmousepos() -> Vector2
Example: local pos = getmousepos()

iswindowactive() -> bool
Example: if not iswindowactive() then return end

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Filesystem: (10 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

writetabletofile(path: string, data: table) -> bool
Serializes a Lua table to JSON and saves it. Automatically creates missing folders.
Example: writetabletofile("Configs/settings.json", {Speed = 16})

loadtablefromfile(path: string) -> table | nil
Loads a JSON file and converts it to a Lua table. Returns nil if file missing/bad.
Example: local data = loadtablefromfile("Configs/settings.json")

requirefile(path: string) -> any
Loads and runs a local Lua file (like 'require' but for files).
Example: local lib = requirefile("Libs/MyLib.lua")

safewritefile(path: string, content: string) -> void
Writes a string to a file, ensuring the folder exists first.
Example: safewritefile("Logs/log.txt", "Started")

getfilesrecursive(folder: string) -> table
Returns a list of all file paths in a folder AND its subfolders.
Example: local files = getfilesrecursive("Scripts")

wipefolder(folder: string) -> void
Recursively deletes a folder and ALL contents (fixes 'delfolder' errors).
Example: wipefolder("Cache")

copyfile(source: string, dest: string) -> bool
Copies a file from source to dest. Auto-creates dest folder.
Example: copyfile("config.json", "config.backup")

movefile(source: string, dest: string) -> bool
Moves a file from source to dest (Copy + Delete).
Example: movefile("temp.lua", "real.lua")

downloadfile(path: string, url: string) -> bool
Downloads content from a URL and saves it to a file.
Example: downloadfile("image.png", "https://example.com/img.png")

appendfilewithlog(path: string, text: string) -> void
Appends text to a file with a timestamp [YYYY-MM-DD HH:MM:SS].
Example: appendfilewithlog("debug.log", "Script executed")

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Drawing: (8 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

drawtriangle(p1, p2, p3, color, filled) -> Triangle
Draws a triangle between three Vector2 points.
Example: drawtriangle(Vector2.new(100,100), Vector2.new(150,200), Vector2.new(50,200))

drawquad(p1, p2, p3, p4, color, filled) -> Quad
Draws a 4-point polygon (essential for 3D boxes).
Example: drawquad(v2_TopLeft, v2_TopRight, v2_BotRight, v2_BotLeft)

drawcircle(pos: Vector2, radius: number, color: Color3, filled: bool) -> Circle
Creates a circle.
Example: local c = drawcircle(Vector2.new(500,500), 50, Color3.new(0,1,0), true)

drawtext(pos: Vector2, text: string, color: Color3, size: number, center: bool) -> Text
Creates text with an outline (for readability).
Example: local t = drawtext(Vector2.new(100,100), "Enemy", Color3.new(1,1,1), 20)

drawsquare(pos: Vector2, size: Vector2, color: Color3, filled: bool) -> Square
Creates a square/rectangle.
Example: local s = drawsquare(Vector2.new(100,100), Vector2.new(50,50), Color3.new(1,0,0))

drawimage(pos, raw_data, size) -> Image
Draws an image from raw file data.
Example: drawimage(Vector2.new(100,100), readfile("my_icon.png"), Vector2.new(32,32))

getscreencenter() -> Vector2
Returns the exact center of the screen (useful for crosshairs or FOV circles).
Example: local circle = drawcircle(getscreencenter(), 100, Color3.new(1,1,1))

cleardrawings() -> void
Wipes ALL drawing objects currently on screen.

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Network: (4 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

simpleget(url: string) -> string | nil
A wrapper for game:HttpGet. Returns the raw body string or nil on failure.
Example: local rawHtml = simpleget("https://google.com")

simplerequest(url: string, method: string, headers: table, body: string) -> table
Sends a raw HTTP request. Method defaults to "GET".
Returns a table containing {Success, StatusCode, Body, Headers}.
Example: 
local res = simplerequest("https://example.com", "POST", {}, "raw_data")
print(res.StatusCode)

jsonrequest(url: string, method: string, data: table) -> table | nil
Automatically JSON encodes the 'data' table, sends it with the correct headers,
and attempts to JSON decode the response.
Example: 
local response = jsonrequest("https://api.mygame.com/save", "POST", {Score = 100})
print(response.Success)

sendwebhook(url: string, payload: string | table) -> void
Quickly sends a message to a Discord webhook. 
Accepts a simple string (message content) OR a table (for embeds/username/avatar).
Example (Simple): sendwebhook("https://discord.com/api/...", "Hello World!")
Example (Complex): sendwebhook("url", { content = "Hi", username = "Bot" })

-----------------------------------------------------------------------
-----------------------------------------------------------------------
More Debug: (5 functions)
-----------------------------------------------------------------------
-----------------------------------------------------------------------

benchmark(name: string, func: function, iterations: int) -> void
Runs a function multiple times and prints how long it took.
Great for checking if your code is lagging the game.
Example: 
benchmark("Heavy Math", function() 
    for i=1,1000 do math.sqrt(i) end 
end, 100)

getfps() -> number
Returns the current Frames Per Second.
Example: if getfps() < 30 then print("Lagging!") end

getping() -> number
Returns the current network ping in milliseconds.
Example: drawtext(pos, "Ping: " .. getping() .. "ms", Color3.new(1,1,1))

getmemory() -> number
Returns the current memory usage of the Roblox client in Megabytes.
Example: log("RAM Used: " .. getmemory() .. "MB")

inspect(tbl: table) -> string
Returns a formatted string representation of a table (recursive).
Example: print(inspect({a=1, b={c=2}}))
Output:
{
  ["a"] = 1,
  ["b"] = {
    ["c"] = 2,
  },
}