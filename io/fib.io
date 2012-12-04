fib_rec := method(n, if(n <= 2, 1,
  fib_rec(n-1) + fib_rec(n-2)))

fib_loop := method(n,
  if(n <= 2, 1,
    iminus2 := 1
    iminus := 1
    for (i, 3, n, 1,
      sum := iminus2 + iminus
      iminus2 = iminus
      iminus = sum)))

fib := method(n, fib_loop(n))

list(1, 2, 3, 4, 5, 6, 7, 8) map(i, fib(i)) join(" ") println
