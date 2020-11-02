(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

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
