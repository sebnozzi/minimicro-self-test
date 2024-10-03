// Grab values back from globals
testOutputLines = globals["_testOutput"]
testFile = globals["_testFile"]
testIdx = globals["_testIdx"]
// Restore print
print = globals["_printFn"]

// Increase index and update file
testIdx += 1
file.writeLines(file.child("temp", "test-index.txt"), [ str(testIdx) ])

// Parse expected output lines
testSrcLines = file.readLines(testFile)
expectedOutputLines = []
parsingOutput = false
for line in testSrcLines
	if parsingOutput then
    isCommentLine = line.indexOf("// ") != null
    if not isCommentLine then break
    // Strip the comment marker
    contentIdx = line.indexOf("// ") + len("// ")
    line = line[contentIdx:]
		expectedOutputLines += [line]
	end if
	if line.indexOf("// Expected:") != null then
		parsingOutput = true
		continue
	end if
end for

writeReport = function(lines)
	handle = file.open(file.child("temp", "report.txt"), "a")
	for line in lines
		handle.writeLine line
	end for
	handle.close
end function

// Compare expected with actual output
failureLines = []

reportDifferingLines = function
  lineWord = function(lines)
    if lines.len == 1 then return "line" else return "lines"
  end function
  failureLines.push "  Expected "+ len(expectedOutputLines) +" "+lineWord(expectedOutputLines)+":"
  for line in expectedOutputLines
    failureLines.push "    " + line
  end for
  failureLines.push "  Actual ("+ len(testOutputLines) +" "+lineWord(testOutputLines)+"):"
  for line in testOutputLines
    failureLines.push "     " + line
  end for
end function

if len(testOutputLines) > len(expectedOutputLines) then
	failureLines.push "FAIL - " + testFile
	failureLines.push "  More actual output than expected!"
  reportDifferingLines
else if len(testOutputLines) < len(expectedOutputLines) then
	failureLines.push "FAIL - " + testFile
	failureLines.push "  Less actual output than expected!"
  reportDifferingLines
else
	for idx in range(0, len(expectedOutputLines) - 1)
		actual = testOutputLines[idx]
		expected = expectedOutputLines[idx]
		if actual != expected then
			failureLines.push "FAIL - " + testFile
			failureLines.push "  Content differs at line " + idx + "!"
			failureLines.push "  Expected: " + expected
			failureLines.push "  Actual  : " + actual
      // Only report first difference
      break
		end if
	end for
end if

if failureLines.len > 0 then
	writeReport failureLines
  text.color = color.red
  print "FAIL!"
else
	lines = ["PASS - " + testFile]
	writeReport lines
  text.color = color.green
  print "PASS"
end if

// Reboot. Next test will be picked up automatically.
reboot
