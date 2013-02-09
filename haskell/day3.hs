module Main where
    hash = [(23, []), (42, [("lol", []), ("rofl", [("heh", 9001)])])]

    getInner = return hash >>= lookup 42 >>= lookup "rofl" >>= lookup "heh"

    data Node = Exits Integer [(Int,Int)] deriving (Show, Eq)
    data Maze = Maze [[Node]] deriving (Show)

    myMaze = Maze [[Exits 1 [(0,1)], Exits 2 [(1,1), (0,2)], Exits 3 []],
                   [Exits 4 [], Exits 5 [(1,2)], Exits 6 [(2,2)]],
                   [Exits 6 [], Exits 8 [], Exits 9 []]]

    nodeFromMaze :: Maze -> (Int,Int) -> Node
    nodeFromMaze (Maze maze) (x,y) = maze !! x !! y

    mazeNode :: (Int,Int) -> Node
    mazeNode = nodeFromMaze myMaze

    startNode = mazeNode (0,0)
    targetNode = mazeNode (2,2)
    startPath = [[startNode]]
    checkIfEnd n = endNode == n

    -- takes the last node and creates new paths with all possible exit nodes
    extendPath path = let end = last path
                          Exits _ ways = end
                          exitNodes = map mazeNode ways
                          in map (\n -> path ++ [n]) exitNodes

    endNode = last
    -- filter out valid solutions
    completePaths path = filter (\p -> (endNode p) == targetNode) path
    -- check if we found valid solutions, otherwise >>= extendPath
    exploreMaze p = let complete = completePaths p
                        found = complete /= []
                        in if found then (head complete) else exploreMaze (p >>= extendPath)

    solution = exploreMaze startPath
