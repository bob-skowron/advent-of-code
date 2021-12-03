
f = open("day-1/puzzle-input.txt")
lines = readlines(f)

int_array = [parse(Int, x) for x in lines]

# part 1
diff_array = append!(int_array[2:end], int_array[end]) .- int_array

inc_count = sum(diff_array .> 0)
println("Number of increases: ", inc_count)

# part 2
window_array = int_array[1:end-2] .+ int_array[2:end-1] .+ int_array[3:end]
window_diff_array = append!(window_array[2:end], window_array[end]) .- window_array
inc_count = sum(window_diff_array .> 0)
println("Number of increases: ", inc_count)