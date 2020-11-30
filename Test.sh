passedTests=0
failedTests=0

function test() {

    testName=$1
    params=$2
    expectedСode=$3

    ./.build/debug/Run ${params}
    actualСode=$?

    if [ $actualCode -eq $expectedCode ]
    then
        ((passedTests++))
        echo "$testName passed with $actualCode (expected $expectedCode)"
    else
        ((failedTests++))
        echo "$testName failed with $actualCode (expected $expectedCode)"
    fi
}

test "" 1
test "search" 0
test "search -k cat" 0
test "search -l es" 0
test "search -k milk" 1
test "search -k cat -l ru" 0
test "search -b cat" 5
test "search -k cat -с esp" 6
test "delete -k nigth" 0
test "delete -k horse" 2
test "delete -l en" 0
test "delete -k hello -l es" 0
test "delete -j cat -l ru" 2
test "update kit -k cat -l ukr" 0
test "update kit -k cat -t ukr" 6


echo "Tests passed: $passedTests"
echo "Tests failed: $failedTests"


if [ $failedTests -eq 0 ]; then
  exit 0
else
  exit 1
fi 