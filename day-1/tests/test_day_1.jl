include("../day_1.jl")
using Test
using .Day1

int_array = Day1.parse_file("day-1/tests/test-input.txt")

@testset "Day 1" begin
    @test int_array == [199,
    200,
    208,
    210,
    200,
    207,
    240,
    269,
    260,
    263]

    @test Day1.calc_increase(int_array) == 7

    @test Day1.calc_increase_window(int_array) == 5
end