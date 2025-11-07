function transform(x::Array{C, 2}, p::Palette) where C <: Colorant
    stacked = reshape(channelview(x), length(eltype(x)), prod(size(x)))
    transformed = nonneg_lsq(channelview(p), stacked; alg=:fnnls)
    unstacked = reshape(transformed, length(p), size(x)...)
    return Channelview(unstacked)
end

function preview(x::Channelview, p::Palette)
    size(x)[1] == length(p) || throw(DimensionMismatch("The number of channels and the palette length do not match."))
    mapreduce(
        (k, v) -> clamp01nan!(k) .* v,  # mapped operation
        +,  # reduction
        eachslice(x.pixels; dims = 1), p.colors
    )
end

function Images.save(path, x::Channelview, p::Palette)
    parent..., file = splitpath(path)
    map(eachslice(x.pixels; dims = 1), p.names) do channel, name
        filepath = joinpath(joinpath(parent), "$(file)_$(name).png")
        save(filepath, clamp01nan!(1 .- channel))
        # TODO: 1 .- channel is good for "viewing" it, but for printing? 
    end
end
