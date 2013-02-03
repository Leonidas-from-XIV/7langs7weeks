{-# LANGUAGE NoMonomorphismRestriction #-}
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

    -- contacts:
    -- tennessee: missisippi, alabama, georgia
    -- missisippi: alabama, tennessee
    -- alabama: tennessee, missisippi, georgia, florida
    -- georgia: tennessee, alabama, florida
    -- florida: alabama, georgia
    -- states: tennessee, missisippi, alabama, georgia, florida
    valid (t, m, _, _, _) | t == m = False
    valid (t, _, a, _, _) | t == a = False
    valid (t, _, _, g, _) | t == g = False
    valid (t, m, _, _, _) | t == m = False
    valid (_, m, a, _, _) | m == a = False
    valid (t, _, a, _, _) | t == a = False
    valid (_, m, a, _, _) | m == a = False
    valid (_, _, a, g, _) | a == g = False
    valid (_, _, a, _, f) | a == f = False
    valid (t, _, _, g, _) | t == g = False
    valid (_, _, a, g, _) | a == g = False
    valid (_, _, _, g, f) | g == f = False
    valid (_, _, a, _, f) | a == f = False
    valid (_, _, _, g, f) | g == f = False
    valid _ = True
    -- yes, I know that some of these are reduntant, but I think that should be
    -- fine, considering it is a mapping state -> contacts

    candidateSolutions () =
        let c = ["red", "green", "blue"]
        in [(x,y,z,u,v) | x <- c, y <- c, z <- c, u <- c, v <- c]

    validSolutions = filter valid
    -- or this, with MonomorphismRestriction
    --validSolutions sols = filter valid sols
