module Day3

    export parse_file, calc_gamma_epsilon

    function parse_file(file_path)
        f = open(file_path)
        lines = readlines(f)    

        bin_matrix = [parse.(Int64, split(x, ""))  for x in lines]

        return hcat(bin_matrix...) #note that this is pivoted
    end

    # part 1
    function calc_gamma_epsilon(bin_matrix)

        most_common = convert.(Int, sum(bin_matrix, dims=2) .> size(bin_matrix)[2]/2)

        gamma = parse(Int, join(most_common), base=2)
        epsilon = parse(Int, join(1 .- most_common), base=2)

        return (gamma, epsilon)
    end

    # part 2
end


bin_matrix = Day3.parse_file("day-3/puzzle-input.txt")

(gamma, eps) = Day3.calc_gamma_epsilon(bin_matrix)
print("Part1 - Gamma * Epsilon: ", gamma*eps)

