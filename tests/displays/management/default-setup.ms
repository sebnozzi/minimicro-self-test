
modeNames = [
"off","solid","text","pixel","tile","sprite"]

for slotNr in range(0,7)
	mode = display(slotNr).mode
	name = modeNames[mode]
	print "Slot: " + slotNr + ". Mode: " + name + " (" + mode + ")"
end for

// Expected:
// Slot: 0. Mode: off (0)
// Slot: 1. Mode: off (0)
// Slot: 2. Mode: off (0)
// Slot: 3. Mode: text (2)
// Slot: 4. Mode: sprite (5)
// Slot: 5. Mode: pixel (3)
// Slot: 6. Mode: off (0)
// Slot: 7. Mode: solid (1)