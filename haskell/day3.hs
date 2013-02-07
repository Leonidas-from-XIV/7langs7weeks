module Main where
    hash = [(23, []), (42, [("lol", []), ("rofl", [("heh", 9001)])])]

    getInner = Just hash >>= lookup 42 >>= lookup "rofl" >>= lookup "heh" >>= return
