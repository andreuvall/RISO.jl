using Images
using Colors
using ColorTypes
using ColorVectorSpace
using RISO

image = CMY.(float.(load("test/wcmyk-squares_rgb8.png")))

p = Palette([CMY(C), CMY(M), CMY(Y)])
preview(p)

transformed = transform(image, p)

preview(transformed, p)
save("result", transformed)