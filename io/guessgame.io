desiredNumber := (Random value * 100) floor + 1

readLine := method(File standardInput readLine)

readNumber := method(readLine asNumber)

checkInput := method(number, if(number == desiredNumber, list("Right", true),
  if(number < desiredNumber, list("Larger", false), list("Smaller", false))))

for(i, 0, 10, 1,
  "Enter guess: " print
  run := checkInput(readNumber)
  run at(0) println
  if(run at(1), break))
