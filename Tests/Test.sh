swift build

allTests=()
amountTests=10
allRuntimes=0

passedTests=0
failedTests=0

allTests[0]="search"
allTests[1]="search -k cat"
allTests[2]="search -l en"
allTests[3]="search -k cat -l en"
allTests[4]="update Dog -k dog -l en"
allTests[5]="delete -k dia -l pt"
allTests[6]="search -k anotherword"
allTests[7]="search -l anotherlanguage"
allTests[8]="delete -l pt"
allTests[9]="delete -k dia"

expectedExitCodes=(0 0 0 0 0 0 0 0 13 13 12 13)

for ((i = 0; i < "$amountTests"; i++)); do
  let allRuntimes++
  
  test=${allTests[$i]}
  expectedExitCode=${expectedExitCodes[$i]}
  ./.build/debug/Run ""${test}""
  
  exitCode="$?"
  echo $exitCode
  if [ "$exitCode" == "$expectedExitCode" ]; then
    echo "Test $i passed: exit code - $exitCode."
    let passedTestsCount++
  else
    echo "Test $i failed: received - $exitCode expected - $failedTestsCount."
  fi
done

echo "Tests count:" $allRuntimes
echo "Tests passed:" $passedTests
echo "Tests failed:" $failedTests