
# TODO: properly use input
# TODO: write unit tests
with open("puzzle-input.txt") as f:
    lines = f.readlines()

int_array = [int(s.strip()) for s in lines]

# part 1
diff_array = [a-b for a, b in zip(int_array[1:] + [float("nan")], int_array)]

inc_count = len(list(filter(lambda x: (x > 0), diff_array)))
print("Number of increases: ", inc_count)

# part 2
window_array = [a+b+c for a, b,c in zip(int_array[:-2],  int_array[1:-1], int_array[2:])]
window_diff_array = [a-b for a, b in zip(window_array[1:] + [float("nan")], window_array)]
inc_count = len(list(filter(lambda x: (x > 0), window_diff_array)))
print("Number of increases: ", inc_count)
