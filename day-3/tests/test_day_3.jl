include("../day_3.jl")
using Test
using .Day3


bin_matrix = Day3.parse_file("day-3/tests/test-input.txt")

@testset "Day 3" begin
    @test bin_matrix == [ 0  1  1  1  1  0  0  1  1  1  0  0;
    0  1  0  0  0  1  0  1  0  1  0  1;
    1  1  1  1  1  1  1  1  0  0  0  0;
    0  1  1  1  0  1  1  0  0  0  1  1;
    0  0  0  1  1  1  1  0  0  1  0  0]

    @test Day3.calc_gamma_epsilon(bin_matrix) == (22, 9)

    @test Day3.calc_oxy_co2(bin_matrix) == (23, 10)
end