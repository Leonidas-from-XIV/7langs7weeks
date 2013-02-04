module Main where
    merge [] [] = []
    merge xs [] = xs
    merge [] xs = xs
    merge (h1:t1) (h2:t2) | h1 <= h2 = h1:(merge t1 (h2:t2))
    merge (h1:t1) (h2:t2) = h2:(merge (h1:t1) t2)

    sort :: [Integer] -> [Integer]
    sort [] = []
    sort [a] = [a]
    sort [a, b] | a <= b = [a, b]
    sort [a, b] = [b, a]
    sort xs = let l = length xs
                  (a, b) = splitAt (l `div` 2) xs
              in merge (sort a) (sort b)

    fnmerge f [] [] = []
    fnmerge f xs [] = xs
    fnmerge f [] xs = xs
    fnmerge f (h1:t1) (h2:t2) | (f h1 h1) = h1:(fnmerge f t1 (h2:t2))
    fnmerge f (h1:t1) (h2:t2) = h2:(fnmerge f (h1:t1) t2)

    fnsort f [] = []
    fnsort f [a] = [a]
    fnsort f [a, b] | (f a b) = [a, b]
    fnsort f [a, b] = [b, a]
    fnsort f xs = let l = length xs
                      (a, b) = splitAt (l `div` 2) xs
                  in fnmerge f (fnsort f a) (fnsort f b)
