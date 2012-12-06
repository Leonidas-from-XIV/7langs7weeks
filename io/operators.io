OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg))
  r)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)))

# emulate "  " * 3 from Python
Sequence * := method(n,
  r := Sequence clone
  n repeat(r appendSeq(self))
  r)

doRelativeFile("enhancedbuilder.io")
