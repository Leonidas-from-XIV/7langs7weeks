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
    valid (t1, t2, _, _, _) | t1 == t2 = False
    valid (t1, _, t2, _, _) | t1 == t2 = False
    valid (t1, _, _, t2, _) | t1 == t2 = False
    valid (m1, m2, _, _, _) | m1 == m2 = False
    valid (_, m1, m2, _, _) | m1 == m2 = False
    valid (a1, _, a2, _, _) | a1 == a2 = False
    valid (_, a1, a2, _, _) | a1 == a2 = False
    valid (_, _, a1, a2, _) | a1 == a2 = False
    valid (_, _, a1, _, a2) | a1 == a2 = False
    valid (g1, _, _, g2, _) | g1 == g2 = False
    valid (_, _, g1, g2, _) | g1 == g2 = False
    valid (_, _, _, g1, g2) | g1 == g2 = False
    valid (_, _, f1, _, f2) | f1 == f2 = False
    valid (_, _, _, f1, f2) | f1 == f2 = False
    valid _ = True
    -- yes, I know that some of these are reduntant, but I think that should be
    -- fine, considering it is a mapping state -> contacts

    candidateSolutions () =
        let c = ["red", "green", "blue"]
        in [(x,y,z,u,v) | x <- c, y <- c, z <- c, u <- c, v <- c]

    validSolutions = filter valid
    -- or this, with MonomorphismRestriction
    --validSolutions sols = filter valid sols
