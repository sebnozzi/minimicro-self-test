clear

display(0).mode = displayMode.solidColor
display(0).color = color.brown

img = Image.fromScreen
p = img.pixel(300,300)

display(0).mode = displayMode.off

print p

// Expected:
// #996633FF
