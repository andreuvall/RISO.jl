struct Channelview{T <: AbstractFloat}
    pixels::Union{Array{T, 3}, Base.ReinterpretArray{T, 3}}
end

function Channelview(x::Array{C, 2}) where C <: Colorant{T} where T <: AbstractFloat
    Channelview{T}(channelview(x))
end
Base.size(x::Channelview{T}) where T <: AbstractFloat = size(x.pixels)
Base.eltype(x::Channelview{T}) where T <: AbstractFloat = eltype(x.pixels)
