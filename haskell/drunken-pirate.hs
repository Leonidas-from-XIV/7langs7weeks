module Main where
    stagger :: (Num t) => t -> t
    stagger d = d + 2
    crawl d = d + 1

    treasureMap d =
        crawl(
        stagger (
        stagger d))
