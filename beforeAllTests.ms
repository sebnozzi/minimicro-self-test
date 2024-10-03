file.delete(file.child("temp", "report.txt"))

gatherTestFiles = function(path)
	testFiles = []
	for entry in file.children(path)
		fullRelativePath = file.child(path, entry)		
		// Ignore entries starting with underscore
		isIgnored = entry.indexOf("_") == 0
		isDirectory = file.info(fullRelativePath).isDirectory
		isMiniScriptFile = entry[-3:] == ".ms"
		
		if isIgnored then continue
		if isDirectory then
			testFiles += gatherTestFiles(fullRelativePath)
		else if isMiniScriptFile then
			testFiles += [fullRelativePath]
		end if
	end for
	return testFiles
end function

testFiles = gatherTestFiles("tests")

if not file.exists("temp") then file.makedir("temp")

file.writeLines file.child("temp", "test-files.txt"), testFiles

file.writeLines file.child("temp", "test-index.txt"), ["0"]

run "test.ms"
