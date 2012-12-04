fib_rec := method(n, if(n <= 2,
  1,
  fib_rec(n-1) + fib_rec(n-2)))

fib_loop := method(n)

fib := method(n, fib_loop(n))

fib(1) println
fib(4) println
