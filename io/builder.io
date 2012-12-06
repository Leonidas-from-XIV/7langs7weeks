# emulate "  " * 3 from Python
Sequence * := method(n,
  r := Sequence clone
  n repeat(r appendSeq(self))
  r)

Builder := Object clone
Builder indentLevel := 0
Builder indentString := "  "
Builder forward := method(
  writeln(indentString * indentLevel, "<", call message name, ">")
  indentLevel = indentLevel + 1
  call message arguments foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence",
      writeln(indentString * indentLevel, content)))
  indentLevel = indentLevel - 1
  writeln(indentString * indentLevel, "</", call message name, ">"))

Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript"))
