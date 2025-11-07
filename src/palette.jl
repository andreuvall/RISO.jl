struct Palette{C <: Colorant, T <: Union{Symbol, String}}
    colors::Vector{C}
    names::Vector{T}
    function Palette(colors::Vector{C}, names::Vector{T}) where {C <: Colorant, T <: Union{Symbol, String}}
        length(unique(colors)) == length(colors) || throw(ArgumentError("The colors must be unique."))
        length(colors) == length(names) || throw(DimensionMismatch("The number of colors and names do not match."))
        new{C, T}(colors, names)
    end
end

function Palette(colors::Vector{C}) where C <: Colorant
    names = [Symbol("c$i") for i in range(1, length(colors))]
    Palette(colors, names)
end

Base.getindex(p::Palette, i::Int) = p.colors[i]
function Base.setindex!(p::Palette{C}, c::C, i::Int) where C <: Colorant
    p.colors[i] = c
    return p
end
Base.length(p::Palette) = length(p.colors)
Images.channelview(p::Palette) = channelview(p.colors)
LinearAlgebra.rank(p::Palette) = rank(channelview(p))

function LinearAlgebra.inv(p::Palette{C}) where C <: Colorant
    m = channelview(p)
    m⁻¹ = if rank(m) == length(C) && length(p) <= 3
        @info "The associated matrix is invertible." 
        inv(m)
    else
        @info "The associated matrix is not invertible. Pseudoinversion will be attempted."
        pinv(m)
    end
    return m⁻¹
end

function preview(p::Palette)
    p.colors
end

const W = RGB(255/255, 255/255, 255/255)
const C = RGB(0/255, 255/255, 255/255)
const M = RGB(255/255, 0/255, 255/255)
const Y = RGB(255/255, 255/255, 0/255)
const K = RGB(0/255, 0/255, 0/255)

const YELLOW = RGB(255/255, 232/255, 0/255)
const BLACK = RGB(0/255, 0/255, 0/255)
const FLUORESCENT_ORANGE = RGB(255/255, 116/255, 119/255)
const FLUORESCENT_PINK = RGB(255/255, 72/255, 176/255)
const BLUE = RGB(0/255, 120/255, 191/255)
const METALLIC_GOLD = RGB(172/255, 147/255, 110/255)
const GREEN = RGB(0/255, 169/255, 92/255)
const BRIGHT_READ = RGB(241/255, 80/255, 96/255)
const RISO_FEDERAL_BLUE = RGB(61/255, 85/255, 136/255)
const PURPLE = RGB(118/255, 91/255, 167/255)
const TEAL = RGB(0/255, 131/255, 138/255)
const HUNTER_GREEN = RGB(64/255, 112/255, 96/255)
const AQUA = RGB(94/255, 200/255, 229/255)
const GRAY = RGB(146/255, 141/255, 136/255)
