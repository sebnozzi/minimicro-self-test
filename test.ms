clear

// Detect if first-run
if not file.exists("temp") or not file.exists(file.child("temp", "test-index.txt")) then
    run "beforeAllTests.ms"
else
	run "beforeEachTest.ms"
end if
