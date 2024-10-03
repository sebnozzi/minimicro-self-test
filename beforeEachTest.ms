
// Load test files
testFiles = file.readLines(file.child("temp", "test-files.txt"))

// Load test index
testIdx = 0
testIdxLines = file.readLines(file.child("temp", "test-index.txt"))
if testIdxLines.len > 0 then
    testIdx = val(testIdxLines[0])
end if

if testIdx < len(testFiles) then
    // Run current test
    currentTestFile = testFiles[testIdx]
    
    // Set globals - used "after each test"
    globals["_testOutput"] = []
    globals["_testFile"] = currentTestFile
    globals["_testIdx"] = testIdx
    globals["_printFn"] = @print

    // Register script to be run after each test
    env.shell = "afterEachTest.ms"

    // Hijack the "print" function to gather test-output
    originalPrint = @print
    print = function(s="",delimiter)
        originalPrint(s,delimiter)
        globals["_testOutput"] = globals["_testOutput"] + [s]
    end function

    // Run the test
    run currentTestFile
else
    // If done testing, run final script
    run "afterAllTests.ms"
end if
