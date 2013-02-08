module Main where
    hash = [(23, []), (42, [("lol", []), ("rofl", [("heh", 9001)])])]

    getInner = return hash >>= lookup 42 >>= lookup "rofl" >>= lookup "heh"

    data Node = Exits [(Integer,Integer)] deriving (Show)
    data Maze = Maze [[Node]] deriving (Show)

    myMaze = Maze [[Exits [(0,1)], Exits [(1,1), (0,2)], Exits []],
                   [Exits [], Exits [(1,2)], Exits [(2,2)]],
                   [Exits [], Exits [], Exits []]]

    nodeFromMaze maze (x,y) = maze !! x !! y
