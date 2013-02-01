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

; barber <serviced>
(def barber (agent 0))
; seats <free>
(def free-seats (agent 3))

(defn any-seat-occupied? []
  (< @free-seats 3))

(defn free-seat [free]
  (inc free))

(defn try-occupy [free]
  (if (= free 0) 0 (dec free)))

(defn cut-hair [serviced]
  (if (any-seat-occupied?)
    (do
      (send free-seats free-seat)
      (Thread/sleep 20)
      (inc serviced))
    serviced))

(def continue-running (atom true))

(defn move-to-chair []
  (loop []
    (if @continue-running
      (do
        (send barber cut-hair)
        (recur)))))

(defn client-arrive []
  (loop []
    (if @continue-running
      (let [time (+ 10 (rand-int 20))]
        (Thread/sleep time)
        (send free-seats try-occupy)
        (recur)))))

(.start (Thread. move-to-chair))
(.start (Thread. client-arrive))
(Thread/sleep (* 10 1000))
(println @barber)
(reset! continue-running false)
(shutdown-agents)
