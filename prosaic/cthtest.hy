(import json)
(import [time [time]])
(import [cthulhu [poem-from-template build-sound-cache]])
(import [pymongo [MongoClient]])

(def db (. (MongoClient) prosaic phrases))
;(def db (. (MongoClient) cbprop phrases))

(def sound-cache (build-sound-cache db))

(def sonnet [{"rhyme" "A"}
             {"rhyme" "B"}
             {"rhyme" "A"}
             {"rhyme" "B"}

             {"rhyme" "C"}
             {"rhyme" "D"}
             {"rhyme" "C"}
             {"rhyme" "D"}

             {"rhyme" "E"}
             {"rhyme" "F"}
             {"rhyme" "E"}
             {"rhyme" "F"}

             {"rhyme" "G"}
             {"rhyme" "G"}])

(def haiku [{"syllables" 5}
            {"syllables" 7}
            {"syllables" 5}])

(def complex [{"fuzzy" "the"
                "keyword" "a"
                "syllables" 5
                "rhyme" "A"}
               {"fuzzy" "he"
                "keyword" "replied"
                "syllables" 7
                "rhyme" "B"}
               {"fuzzy" "vain"
                "keyword" "hearken"
                "syllables" 5
                "rhyme" "A"}])

(def sonnet0 [{"rhyme" "A"
              "syllables" 10
              "keyword" "why"}
             {"rhyme" "B"
              "syllables" 10}
             {"rhyme" "A"
              "syllables" 10
              "keyword" "is"}
             {"rhyme" "B"
              "syllables" 10}

             {"rhyme" "C"
              "syllables" 10
              "keyword" "the"}
             {"rhyme" "D"
              "syllables" 10}
             {"rhyme" "C"
              "syllables" 10
              "keyword" "sky"}
             {"rhyme" "D"
              "syllables" 10}

             {"rhyme" "E"
              "syllables" 10
              "keyword" "blue"}
             {"rhyme" "F"
              "syllables" 10}
             {"rhyme" "E"
              "syllables" 10}
             {"rhyme" "F"
              "syllables" 10}

             {"rhyme" "G"
              "syllables" 10}
             {"rhyme" "G"
              "syllables" 10}])


(print "Go!")
(def start (time))
(print (list (map (fn [x] (.get x "raw")) (poem-from-template sonnet0 db sound-cache))))
(def end (time))
(print "Took " (- end start))

;(def rulesets (template->rulesets db template))

;(def first-ruleset (first rulesets))

;(print (.to-query first-ruleset))
;(print (list (map (fn [r] (. r strength)) (. first-ruleset rules))))
;(.weaken! first-ruleset)
;(print (list (map (fn [r] (. r strength)) (. first-ruleset rules))))
;(print (.to-query first-ruleset))


;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template-async haiku db))))
;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template-sync haiku db))))

;(def couplet [{"rhyme" "A"}
;              {"rhyme" "A"}])
;
;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template couplet db))))
;
;(def stanza [{"rhyme" "A"}
;             {"rhyme" "B"}
;             {"rhyme" "A"}
;             {"rhyme" "B"}])
;;
;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template stanza db))))
;
;(def keywords [{"keyword" "he"}
;               {"keyword" "catacomb"}
;               {"keyword" "satisfy"}])
;
;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template keywords db))))
;
;(def fuzzies [{"fuzzy" "he"}
;              {"fuzzy" "catacomb"}
;              {"fuzzy" "satisfy"}])
;
;(print (poem-from-template fuzzies db))


;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template-async sonnet db))))
;(print (list (map (fn [p] (. p ["raw"] )) (poem-from-template-sync sonnet db))))
