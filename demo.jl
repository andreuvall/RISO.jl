# load the required packages
using Images
using Colors
using ColorTypes
using ColorVectorSpace
using RISO

# load the input image in RGB
# (this path works when run from the repository root)
image_rgb = load("test/wcmyk-squares-rgb8.png")

# specify the target palette in RGB
p_rgb = Palette([
        RGB( 61/255,  85/255, 136/255),     # Riso-Federal Blue
        RGB(255/255, 116/255, 119/255),     # Fluorescent Orange
        RGB(255/255, 232/255,   0/255)      # Yellow
    ]
)
preview(p_rgb)

# express the image as fractional and convert it to CMY
# dot-broadcasting works because `image_rgb` is an array
image = (CMY ∘ float).(image_rgb)

# express the palette as fractional and convert it to CMY
# map, don't dot-broadcast, because `Palette` is not an `AbstractArray`
p = map(CMY ∘ float, p_rgb)

# re-express the image in the target palette
transformed = transform(image, p)
preview(transformed, p)

# save the grayscale images
save(joinpath(".", "result"), transformed, p)