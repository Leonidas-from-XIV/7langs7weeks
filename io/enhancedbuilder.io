Builder := Object clone
Builder indentLevel := 0
Builder indentString := "  "
Builder forward := method(
  write(indentString * indentLevel, "<", call message name)
  indentLevel = indentLevel + 1
  call message arguments foreach(index, arg,
    content := self doMessage(arg)
    writeln("Index", index)
    if(index == 0,
      if(content type == "Map",
        attrs := list()
        content keys foreach(key,
          attrs append(key .. "=\"" .. content at(key) .. "\""))
        writeln(" ", attrs join(" ") , ">"),
	writeln(">")))
    if(content type == "Sequence",
      writeln(indentString * indentLevel, content)))
  indentLevel = indentLevel - 1
  writeln(indentString * indentLevel, "</", call message name, ">"))

attr := { "author" : "Tate" }

Builder book(attr, ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")))
