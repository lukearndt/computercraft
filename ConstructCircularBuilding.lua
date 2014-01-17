load_package("turtle_construction")

local function place_quadrant()
  construct(2)
  turn("right")
  construct(1)
  turn("left")
  construct(2)
  turn("right")
  construct(1)
  turn("left")
  construct(1)
  turn("right")
  construct(1)
  turn("left")
  construct(1)
  turn("right")
  construct(2)
  turn("left")
  construct(1)
  turn("right")
  construct(2)
end


local function place_hollow_layer()
  for count = 1, 4, 1 do
    place_quadrant()
  end
end

local function place_full_layer()
  construct_back(2)
  construct_up(1)
  construct(4)

  build_expanding_row("right", 2, 8)
  build_expanding_row("left", 1, 10)
  build_expanding_row("right", 1, 12)
  build_row("left", 12)
  build_expanding_row("right", 1, 14)

  build_row("left", 14)
  build_row("right", 14)
  build_row("left", 14)
  build_row("right", 14)

  build_contracting_row(1, "left", 12)
  build_row("right", 12)
  build_contracting_row(1, "left", 10)
  build_contracting_row(1, "right", 8)
  build_contracting_row(2, "left", 4)

  turn("right")
  reverse(14)
  turn("left")
  reverse(2)
end

local function place_walls_of_height(height)
  for count = 1, height, 1 do
    construct_up(1)
    place_hollow_layer()
  end
end

local function initialize()
  turtle.select(1)
  turtle.refuel()
  turtle.select(2)

  current_slot = 2

  turn("left")
end

print("Welcome to the circular building constructor.")
print("Each floor or ceiling layer requires 177 blocks (2 stacks + 49).")
print("Each wall layer requires 56 blocks (280 for 5 layers => 4 stacks + 24)")
print("You should subtract any existing floor or ceiling blocks from this count.")

print("Place a floor? y/n")
local place_floor = read()

print("Place a ceiling? y/n")
local place_ceiling = read()

print("How high would you like the walls to be?")
local wall_height = tonumber(read())

print("Would you like to construct ahead and construct the building? y/n")
local continue_confirmation = read()

if not continue_confirmation == "y" then error("Okie dokie, see you later!") end

initialize()

if place_floor == "y" then place_full_layer() end
place_walls_of_height(wall_height)
if place_ceiling == "y" then place_full_layer() end
print("Done!")