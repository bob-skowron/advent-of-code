module Day3

    export parse_file, calc_gamma_epsilon, calc_oxy_co2

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
    function calc_oxy_co2(bin_matrix)
        is_final = Bool(0)
        row_iter = 1

        filtered_matrix = bin_matrix

        # caculate oxy
        while(!is_final)
            # find the most common bit in the current row iteration
            if sum(filtered_matrix[row_iter,:]) >= size(filtered_matrix)[2]/2 # for oxy, >= gets 1
                # filter to matching columns
                filtered_matrix = filtered_matrix[:,filtered_matrix[row_iter, :] .== 1]
            else
                filtered_matrix = filtered_matrix[:,filtered_matrix[row_iter, :] .== 0]
            end

            if size(filtered_matrix)[2] == 1 # if finalized, break loop
                is_final = Bool(1)
            else # else continue with next row
                row_iter += 1 
            end
        end

        oxy = parse(Int, join(filtered_matrix), base=2)

        # reset
        is_final = Bool(0)
        row_iter = 1

        filtered_matrix = bin_matrix
        # caculate co2
        while(!is_final)
            # find the least common bit in the current row iteration
            if sum(filtered_matrix[row_iter,:]) >= size(filtered_matrix)[2]/2 # for co2, <= gets 0
                # filter to matching columns
                filtered_matrix = filtered_matrix[:,filtered_matrix[row_iter, :] .== 0]
            else
                filtered_matrix = filtered_matrix[:,filtered_matrix[row_iter, :] .== 1]
            end

            if size(filtered_matrix)[2] == 1 # if finalized, break loop
                is_final = Bool(1)
            else # else continue with next row
                row_iter += 1 
            end
        end

        co2 = parse(Int, join(filtered_matrix), base=2)

        return (oxy, co2)
    end

end


bin_matrix = Day3.parse_file("day-3/puzzle-input.txt")

(gamma, eps) = Day3.calc_gamma_epsilon(bin_matrix)
print("Part 1 - Gamma * Epsilon: ", gamma*eps)


(oxy, co2) = Day3.calc_oxy_co2(bin_matrix)
print("Part 2 - oxy * co2: ", oxy*co2)
