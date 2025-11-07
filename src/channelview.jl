struct Channelview{T <: AbstractFloat}
    pixels::Union{Array{T, 3}, Base.ReinterpretArray{T, 3}}
end

function Channelview(x::Array{C, 2}) where C <: Colorant{T} where T <: AbstractFloat
    Channelview{T}(channelview(x))
end
Base.size(x::Channelview{T}) where T <: AbstractFloat = size(x.pixels)
Base.eltype(x::Channelview{T}) where T <: AbstractFloat = eltype(x.pixels)

function Images.save(filename, x::Channelview)
    map(enumerate(eachslice(x.pixels; dims = 1))) do (i, channel)
        save("$(filename)_$i.png", clamp01nan!(1 .- channel))
        # TODO: 1 .- channel is good for "viewing" it, but for printing? 
    end
end
