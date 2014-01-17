load_package("turtle_movement")

function mine(direction)
  if direction == "down" then
    turtle.digDown()
  elseif direction == "up" then
    turtle.digUp()
  elseif direction == "forward" then
    turtle.dig()
  else
    error("invalid direction to mine: " .. direction)
  end
end

function smash(blocks, direction)
  direction = direction or "forward"

  mine(direction)
  for times = 1, blocks - 1, 1 do
    move(1, direction)
    mine(direction)
  end
  reverse(blocks - 1)
end

function smash_either_side(blocks)
  turn("left")
  smash(blocks)
  turn("around")
  smash(blocks)
  turn("left")
end

function smash_symmetrical_area(half_width_array)
  steps_taken = 0
  for step = 1, 128, 1 do
    if half_width_array[step] == nil then break end
    smash_either_side(half_width_array[step])
    drill(1)
    steps_taken = steps_taken + 1
  end
  reverse(steps_taken)
end

function drill(times, direction)
  direction = direction or "forward"

  for blocks = 1, times, 1 do
    mine(direction)
    move(direction, 1)
  end
end

function grind(times, surface)
  surface = surface or "down"

  for count = 1, times, 1 do
    forward(1)
    mine(surface)
  end
end

function reverse_grind(times, surface)
  surface = surface or "down"

   for count = 1, times, 1 do
    reverse(1)
    mine(surface)
  end
end

function destructive_pivot(direction, surface)
  turn(direction)
  grind(1)
  turn(direction)
end

function grind_row(direction, length, surface)
  surface = surface or "down"

  destructive_pivot(direction)
  grind(length)
end

function grind_expanding_row(direction, reverse_times, mine_times, surface)
  surface = surface or "down"

  destructive_pivot(direction)
  reverse_grind(reverse_times)
  grind(mine_times)
end

function grind_contracting_row(reverse_times, direction, mine_times, surface)
  surface = surface or "down"

  reverse_grind(reverse_times)
  destructive_pivot(direction)
  grind(mine_times)
end