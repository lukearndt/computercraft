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
    move(direction, 1)
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
    smash_either_side(half_width_array[step])
    if half_width_array[step + 1] == nil then break end
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

function drilling_pivot(direction)
  turn(direction)
  drill(1)
  turn(direction)
end

function drill_row(direction, length)
  drilling_pivot(direction)
  drill(length - 1)
end

function drill_rectangular_area(length, width)
  drill(width - 1)

  local next_turn = "right"
  for times = 1, length - 1, 1 do
    drill_row(next_turn)
    if next_turn == "right" then
      next_turn = "left"
    else
      next_turn = "right"
    end
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

function grinding_pivot(direction, surface)
  turn(direction)
  grind(1)
  turn(direction)
end

function grind_row(direction, length, surface)
  surface = surface or "down"

  grinding_pivot(direction, surface)
  grind(length, surface)
end

function grind_expanding_row(direction, reverse_times, mine_times, surface)
  surface = surface or "down"

  grinding_pivot(direction)
  reverse_grind(reverse_times)
  grind(mine_times)
end

function grind_contracting_row(reverse_times, direction, mine_times, surface)
  surface = surface or "down"

  reverse_grind(reverse_times)
  grinding_pivot(direction)
  grind(mine_times)
end