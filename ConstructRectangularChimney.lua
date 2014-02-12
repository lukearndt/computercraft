load_package("turtle_construction")

local function place_layer(inner_length, inner_width, build_direction)
  for times = 1, 2, 1 do
    build(inner_length + 1)
    turn(build_direction)
    build(inner_width + 1)
    turn(build_direction)
  end
end

local function construct_chimney(inner_length, inner_width, height, build_direction)
  for layer = 1, height, 1 do
    up(1)
    place_layer(inner_length, inner_width, build_direction)
  end
end

local function directionify(l_or_r)
  if l_or_r == "l" then
    return "left"
  elseif l_or_r == "r" then
    return "right"
  else
    error("Invalid direction to build in. Valid options: l or r")
  end
end

print("Welcome to the rectangular chimney constructor.")

print("How long would you like the chimney to be (internally)?")
local inner_length = tonumber(read())

print("How wide would you like the chimney to be (internally)?")
local inner_width = tonumber(read())

print("How high would you like the chimney to be?")
local height = tonumber(read())

local materials_required = 2 * (inner_width + inner_height) + 4
print("You will require " .. materials_required .. " blocks to complete this operation.")

if materials_required > (16 * 64) then
  print("WARNING: A completely full turtle will run out of material before this building is complete!")
else
  print("A completely full turtle should have enough materials to complete the building.")
end

print("Should I smash anything that gets in my way? y/n")
local smash_obstacles = read()

if smash_obstacles == "y" then
  turtle_destructive_movement_mode = true
else
  turtle_destructive_movement_mode = false
end

print("Should I build to the left or to the right? l/r")
local build_direction = directionify(read())

print("Would you like to go ahead and construct the building? y/n")
local continue_confirmation = read()

if not continue_confirmation == "y" then error("Okie dokie, see you later!") end

construct_chimney(inner_length, inner_width, height, build_direction)

print("Done!")
