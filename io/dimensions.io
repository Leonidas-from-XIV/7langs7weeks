TwoDim := List clone
TwoDim dim := method(x, y,
  setSize(y)
  for(i, 0, y-1, 1,
    child := list() setSize(x)
    atPut(i, child)))

TwoDim set := method(x, y, value,
  at(y) atPut(x, value))

TwoDim get := method(x, y,
  at(y) at(x))

TwoDim transpose := method(
  oldY := size
  oldX := at(0) size
  newDim := TwoDim clone
  newDim dim(oldY, oldX)
  newDim println
  for (y, 0, oldY-1, 1,
    for(x, 0, oldX-1, 1,
      newDim set(y, x, get(x, y))))
  newDim)

td := TwoDim clone
td dim(3, 4)
td set(2, 2, "Batman")
td println
td get(2, 2) println
td transpose transpose println
