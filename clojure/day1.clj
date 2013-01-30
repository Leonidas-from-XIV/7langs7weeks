(defn big? [st n]
  (> (count st) 5))

(println (big? "Clojure" 6))
(println (big? "Scala" 6))

(defn subinstance? [thing tpe]
  (let [super (supers (class thing))]
    (contains? super tpe)))

(defn collection-type [col]
  (if (subinstance? col clojure.lang.IPersistentList) :list
    (if (subinstance? col clojure.lang.IPersistentMap) :map
      (if (subinstance? col clojure.lang.IPersistentVector) :vector nil))))

(println (collection-type '()))
(println (collection-type {}))
(println (collection-type []))
(println (collection-type "foo"))
