; whee, even an recursive macro because we can
; and with wariable number of arguments, because that's what 'if' does
(defmacro unless
  ;([test iffalse] (list 'if (list 'not test) iffalse))
  ([test iffalse] (list 'unless test iffalse 'nil))
  ([test iffalse iftrue] (list 'if (list 'not test) iffalse iftrue)))

(defprotocol Rating
  (rating-of [thing])
  (complain [thing]))

(def ratings {:ruby :meh, :io :awesome,
              :prolog :meh, :scala :meh
              :erlang :meh, :clojure :awesome})

(defrecord Rater [thing]
  Rating
  (rating-of [_] (ratings thing))
  (complain [_] (str "Wow, " (clojure.string/capitalize (name thing)) " sucks")))
