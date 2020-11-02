(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; factorial
(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (if (= n 1)
      0
      (product identity 1 inc n)))

;; test
(factorial 5)
(factorial 7)

;; pi-forth
(define (pi-term x)
  (if (even? x)
      (/ (+ x 2) (+ x 1))
      (/ (+ x 1) (+ x 2))))
(define (pi-forth n)
  (product pi-term 1 inc n))

;; test
(* (pi-forth 5) 4.0)
(* (pi-forth 10) 4.0)
(* (pi-forth 100) 4.0)
