module Main where
    merge [] [] = []
    merge xs [] = xs
    merge [] xs = xs
    merge (h1:t1) (h2:t2) = if h1 <= h2 then h1:(merge t1 (h2:t2)) else h2:(merge (h1:t1) t2)

    sort :: [Integer] -> [Integer]
    sort [] = []
    sort [a] = [a]
    sort [a, b] = if a <= b then [a, b] else [b, a]
    sort xs = let l = length xs
                  (a, b) = splitAt (l `div` 2) xs
              in merge (sort a) (sort b)

    fnmerge f [] [] = []
    fnmerge f xs [] = xs
    fnmerge f [] xs = xs
    fnmerge f (h1:t1) (h2:t2) = if (f h1 h1) then h1:(fnmerge f t1 (h2:t2)) else h2:(fnmerge f (h1:t1) t2)

    fnsort f [] = []
    fnsort f [a] = [a]
    fnsort f [a, b] = if (f a b) then [a, b] else [b, a]
    fnsort f xs = let l = length xs
                      (a, b) = splitAt (l `div` 2) xs
                  in fnmerge f (fnsort f a) (fnsort f b)
