module RISO

using Images
using Colors
using ColorTypes
using LinearAlgebra
using NonNegLeastSquares

export Palette, W, C, M, Y, K
export Channelview, save
export transform, preview

include("palette.jl")
include("channelview.jl")
include("transformation.jl")

end
