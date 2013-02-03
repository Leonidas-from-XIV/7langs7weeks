module Main where
    allEven [] = []
    allEven (h:t) = if even h then h:allEven t else allEven t

    allEven1 = filter even
    allEven2 = foldl (\acc item -> if even item then item:acc else acc) []
    allEven3 xs = [x | x <- xs, even x]

    fuckingreverse [] = []
    fuckingreverse (x:xs) = (fuckingreverse xs) ++ [x]

    combinations xs = [(x, y) | x <- xs, y <- xs, x < y]
    combs () = combinations ["black", "white", "blue", "yellow", "red"]

    multitable () =
        let r = [1..12]
        in [(a, b, a*b) | a <- r, b <- r]
