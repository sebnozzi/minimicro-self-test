clear

text.color = color.silver

file.delete(file.child("temp", "test-index.txt"))
file.delete(file.child("temp", "test-files.txt"))

failures = 0
passes = 0

for line in file.readLines(file.child("temp", "report.txt"))
  if line.indexOf("FAIL - ") != null then failures += 1
  if line.indexOf("PASS - ") != null then passes += 1
end for

print "Done running all tests."
print ""

if failures > 0 then
  text.color = color.green
  print "Passed tests: " + passes
  text.color = color.red
  print "Failed tests: " + failures
else
  text.color = color.green
  print "All tests PASS!"
end if

text.color = color.silver
print ""
print "See details in `temp/report.txt`"
print ""
text.color = color.orange
print "You can close this MiniMicro window now."

// Wait "forever" to suggest the user to close the window
wait 10000