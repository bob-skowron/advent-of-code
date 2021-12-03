
f = open("day-2/test-input.txt")
lines = readlines(f)

dir_array = [(split(x, " ")[1], parse(Int64, split(x, " ")[2]))  for x in lines]

# part 1
horizontal_position = sum([x[2] * (x[1] == "forward") for x in dir_array])
vertical_position = sum([x[2] * (x[1] == "up" ? -1 : (x[1] == "down" ? 1 : 0)) for x in dir_array])

print("Depth x Horizonal Position: ", horizontal_position*vertical_position)