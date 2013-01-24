val strings = List("abc", "def", "gh")
println(strings.foldLeft(0)((sum, element) => sum + element.length))
