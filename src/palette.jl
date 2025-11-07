struct Palette{C <: Colorant}
    colors::Vector{C}
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
