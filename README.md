
# MiniMicro Self-Test

This tool performs self-tests of and through MiniMicro.

## Running

Start a MiniMicro instance from the command-line, passing the folder of this project to be mounted in "/usr".

For Windows:

```
X:\path\to\MiniMicro.exe -usr X:\path\to\this\project
```

For Linux:

```
/path/to/MiniMicro -usr /path/to/this/project
```

For OSX either of these:

```
# Variant 1
open -a /path/to/MiniMicro.app --args -usr /path/to/this/project
# Variant 2
/path/to/MiniMicro.app/Contents/MacOS -usr /path/to/this/project
```

Alternatively, mount this project and _then_ restart your MiniMicro instance.

Since it contains a "startup.ms" script, it will automatically start. 

When testing is done, you will see a message telling you so. You can then close the MiniMicro instance manually.

NOTE: it might be a good idea to run this on a MiniMicro installation which
has the initial "chime" turned off as the test-runner will reset the instance repeatedly.

## Tests

Tests are placed in the "tests" directory.

A test is a Mini Script program. A test-script should make use of `print` to print testable output. 

The expected output should be written at the end and is done so in form of comments, formatted like this:

```
// Expected:
// (line 1 of expected output)
// (line 2 of expected output)
// (line 3 of expected output)
// ...
// (last line of expected output)
```

Note the `// Expected:` line. This is an important marker.

## Test directory structure

The "tests" directory can contain any number of sub-directories. This is useful in order to group related tests together.

## Pending tests

A test file starting with an underscore (e.g. "_test_blah.ms") will be ignored / skipped.

## Report

A test-report will be generated under "temp/report.txt".
