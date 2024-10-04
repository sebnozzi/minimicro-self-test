clear

// The combination of a semi-translucent white
// and a strong red should result in a pink color

display(0).mode = displayMode.solidColor
display(0).color = color.rgba(255,255,255,200)

display(1).mode = displayMode.solidColor
display(1).color = color.red

img = Image.fromScreen
p = img.pixel(300,300)

display(0).mode = displayMode.off
display(1).mode = displayMode.off

print p

// Expected:
// #FFC8C8FF