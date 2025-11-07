function transform(x::Array{C, 2}, p::Palette) where C <: Colorant
    stacked = reshape(channelview(x), length(eltype(x)), prod(size(x)))
    transformed = nonneg_lsq(channelview(p), stacked; alg=:fnnls)
    unstacked = reshape(transformed, length(p), size(x)...)
    return Channelview(unstacked)
end

function preview(x::Channelview, p::Palette)
    size(x)[1] == length(p) || throw("The number of channels and the palette length do not match.")
    mapreduce(
        (k, v) -> clamp01nan!(k) .* v,  # mapped operation
        +,  # reduction
        eachslice(x.pixels; dims = 1), p.colors
    )
end
