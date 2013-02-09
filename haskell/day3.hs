module Main where
    hash = [(23, []), (42, [("lol", []), ("rofl", [("heh", 9001)])])]

    getInner = return hash >>= lookup 42 >>= lookup "rofl" >>= lookup "heh"

    data Node = Exits [(Int,Int)] deriving (Show)
    data Maze = Maze [[Node]] deriving (Show)

    myMaze = Maze [[Exits [(0,1)], Exits [(1,1), (0,2)], Exits []],
                   [Exits [], Exits [(1,2)], Exits [(2,2)]],
                   [Exits [], Exits [], Exits []]]

    nodeFromMaze :: Maze -> (Int,Int) -> Node
    nodeFromMaze (Maze maze) (x,y) = maze !! x !! y

    mazeNode :: (Int,Int) -> Node
    mazeNode = nodeFromMaze myMaze

    startNode = mazeNode (0,0)
    endNode = mazeNode (2,2)

    startPath = [[startNode]]
    extendPath path = let end = last path
                          Exits ways = end
                          exitNodes = map mazeNode ways
                          in map (\n -> path ++ [n]) exitNodes
