load_package("turtle_construction")
load_package("turtle_destruction")

local function break_down(height)
  for blocks = 1, height, 1 do
    turtle.digDown()
    down(1)
  end
end

local function place_layer()
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

local function smash_inner_area()
  local half_width_array = {1, 3, 4, 5, 5, 6, 6, 6, 5, 5, 4, 3, 1}
  smash_symmetrical_area(half_width_array)
end

local function construct_building(should_place_floor, wall_height)
  if should_place_floor == "y" then place_layer() end

  place_layer()

  for height = 1, wall_height, 1 do
    place_layer()
    turn("right")
    forward(1)
    drill(2, "down")
    smash_inner_area()
    up(1)
    construct_up(1)
    reverse(1)
    turn("left")
  end
end

local function initialize()
  turtle.select(1)
  turtle.refuel()
  turtle.select(2)

  current_slot = 2

  turn("left")
end

print("Welcome to the dry circular building constructor.")
print("Each floor or ceiling layer requires 177 blocks (2 stacks + 49).")
print("Each wall layer requires 56 blocks (280 for 5 layers => 4 stacks + 24)")
print("You should subtract any existing floor or ceiling blocks from this count.")

print("Place a floor? y/n")
local should_place_floor = read()

print("How high would you like the walls to be (internally)?")
local wall_height = tonumber(read())

print("Would you like to go ahead and construct the building? y/n")
local continue_confirmation = read()

if not continue_confirmation == "y" then error("Okie dokie, see you later!") end

initialize()

construct_building(should_place_floor, wall_height)

print("Done!")