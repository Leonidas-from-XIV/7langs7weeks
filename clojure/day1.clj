(defn big? [st n]
  (> (count st) 5))

(println (big? "Clojure" 6))
(println (big? "Scala" 6))

(defn collection-type [col]
  (cond
    (list? col) :list
    (map? col) :map
    (vector? col) :vector
    :else nil))

(println (collection-type '()))
(println (collection-type {}))
(println (collection-type []))
(println (collection-type "foo"))
