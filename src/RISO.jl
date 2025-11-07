module RISO

using Images
using Colors
using ColorTypes
using LinearAlgebra
using NonNegLeastSquares

export Palette, W, C, M, Y, K,
    YELLOW, BLACK, FLUORESCENT_ORANGE, FLUORESCENT_PINK, 
    BLUE, METALLIC_GOLD, GREEN, BRIGHT_READ, RISO_FEDERAL_BLUE, 
    PURPLE, TEAL, HUNTER_GREEN, AQUA, GRAY
export Channelview, save
export transform, preview

include("palette.jl")
include("channelview.jl")
include("transformation.jl")

end
