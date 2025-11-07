using RISO
using Images
using LinearAlgebra
using Test

@testset verbose = true "RISO.jl" begin

    @testset "CMY" begin
        c, m, y = CMY.([C, M, Y])
        @test isa(c, CMY)
        @test isa(c + m, CMY)
        @test cyan(c) == 1.
        @test magenta(c) == 0.
        @test yellow(c) == 0.

        _c = RGB(c)
        @test isa(_c, RGB)
        @test _c.r == 1 - c.c
        @test _c.g == 1 - c.m
        @test _c.b == 1 - c.y
    end
    @testset "Palette" begin
        palette = Palette(CMY.([C, M, Y]))
        @test length(palette) == 3
        @test rank(palette) == 3
        @test rank(inv(palette)) == 3
        
        palette[2] = CMY(C)
        @test rank(palette) == 2
        @test rank(inv(palette)) == 2

        palette[2] = CMY(M)
        @test rank(palette) == 3
        @test rank(inv(palette)) == 3
    end
    @testset "Named palette" begin
        palette = Palette(CMY.([C, M, Y]), [:cy, :ma, :ye])
        @test palette.names isa Vector{Symbol}
        @test palette.names == [:cy, :ma, :ye]
        @test length(palette) == 3
        
        palette = Palette(CMY.([C, M, Y]), ["cy", "ma", "ye"])
        @test palette.names isa Vector{String}
        @test palette.names == ["cy", "ma", "ye"]
        @test length(palette) == 3

        @test_throws DimensionMismatch("The number of colors and names do not match.") Palette(CMY.([C, M, Y]), [:cy, :ma])
        @test_throws ArgumentError("The colors must be unique.") Palette(CMY.([C, M, M]))
    end

    @testset "Channelview" begin
        palette = Palette(CMY.([C, M, Y]))

        x = CMY.(float.(load("wcmyk-squares_rgb8.png")))
        @test x isa Array{C, 2} where C <: Colorant

        y = Channelview(x)
        @test y isa Channelview{T} where T <: AbstractFloat
        @test y.pixels isa Base.ReinterpretArray{T, 3} where T <: AbstractFloat
    end

    @testset "Transformations" begin
        palette = Palette(CMY.([C, M, Y]))

        x = CMY.(float.(load("wcmyk-squares_rgb8.png")))
        y = transform(x, palette)
        @test y isa Channelview{T} where T <: AbstractFloat
        @test y.pixels isa Array{T, 3} where T <: AbstractFloat
    end
end

