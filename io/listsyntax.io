squareBrackets := method(
  l := List clone
  call message arguments foreach(arg,
    l append(doMessage(arg))
  l))

[1, 2, 3, 3+1] println
