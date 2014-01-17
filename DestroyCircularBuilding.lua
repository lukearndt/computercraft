load_package("turtle_destruction")

local function grind_quadrant()
  grind(2)
  turn("right")
  grind(1)
  turn("left")
  grind(2)
  turn("right")
  grind(1)
  turn("left")
  grind(1)
  turn("right")
  grind(1)
  turn("left")
  grind(1)
  turn("right")
  grind(2)
  turn("left")
  grind(1)
  turn("right")
  grind(2)
end


local function grind_hollow_layer()
  for count = 1, 4, 1 do
    grind_quadrant()
  end
end

local function grind_full_layer()
  reverse_grind(2)
  grind(4)

  grind_expanding_row("right", 2, 8)
  grind_expanding_row("left", 1, 10)
  grind_expanding_row("right", 1, 12)
  grind_row("left", 12)
  grind_expanding_row("right", 1, 14)

  grind_row("left", 14)
  grind_row("right", 14)
  grind_row("left", 14)
  grind_row("right", 14)

  grind_contracting_row(1, "left", 12)
  grind_row("right", 12)
  grind_contracting_row(1, "left", 10)
  grind_contracting_row(1, "right", 8)
  grind_contracting_row(2, "left", 4)

  turn("right")
  reverse(14)
  turn("left")
  reverse(2)
  down(1)
end

local function grind_walls_of_height(height)
  for count = 1, height, 1 do
    grind_hollow_layer()
    down(1)
  end
end

local function initialize()
  turtle.select(1)
  turtle.refuel()
  turtle.select(2)

  current_slot = 2

  turn("left")
end

print("Welcome to the circular building destroyer.")

print("Remove a floor? y/n")
local remove_floor = read()

print("Remove a ceiling? y/n")
local remove_ceiling = read()

print("Is the building hollow? y/n")
local building_is_hollow = read()

print("How high are the walls (internally)?")
local wall_height = tonumber(read())
print("Would you like to go ahead and destroy the building? y/n")
local continue_confirmation = read()

if not continue_confirmation == "y" then error("Okie dokie, see you later!") end

initialize()

if remove_ceiling == "y" then grind_full_layer() end
if building_is_hollow == "y" then
  grind_walls_of_height(wall_height)
else
  for layers = 1, wall_height, 1 do
    grind_full_layer()
  end
end
if remove_floor == "y" then grind_full_layer() end

print("Done!")