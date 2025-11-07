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
