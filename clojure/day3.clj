(def accounts (ref []))

(defn add-account [accounts name]
  (alter accounts conj {:name name, :balance 0.0}))

(defn- adjust-amount [existing new]
  (assoc existing :balance (+ (:balance existing) (:balance new))))

(defn- adjust-if-name [existing new]
  (if (= (:name existing) (:name new))
    (adjust-amount existing new)
    existing))

(defn credit [accounts name amount]
  (alter accounts (fn [acc new]
                    (map #(adjust-if-name % new) acc))
         {:name name :balance amount}))

(defn debit [accounts name amount]
  (credit accounts name (- amount)))

(println (dosync (add-account accounts "Leonidas")))
(println (dosync (credit accounts "Leonidas" 10.0)))
(println (dosync (debit accounts "Leonidas" 5.0)))
