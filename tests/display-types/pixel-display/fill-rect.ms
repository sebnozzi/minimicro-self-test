clear

gfx.clear color.black

gfx.fillRect 100,100,200,50,color.lime
print "Bottom left:"
print gfx.pixel(100-1,100-1)
print gfx.pixel(100,100)
print "Top right:"
print gfx.pixel(100+200-1,100+50-1)
print gfx.pixel(100+200,100+50)

// Expected:
// Bottom left:
// #000000FF
// #00FF00FF
// Top right:
// #00FF00FF
// #000000FF