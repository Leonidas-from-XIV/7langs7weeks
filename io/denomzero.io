division := Number getSlot("/")
Number / = method(other, if(other == 0, 0, self division(other)))

(1 / 0) println
