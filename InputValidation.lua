function validate(input, allowed_values)
  for value = 1, allowed_values, 1 do
    if input == allowed_values[value] then
      return value
    elseif allowed_values[value] == "" then
      error("Invalid input. Valid inputs include: " .. allowed_values)
    end
  end
end
