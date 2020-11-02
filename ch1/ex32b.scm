(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum a b)
  (accumulate + 0 identity a inc b))
(define (product a b)
  (accumulate * 1 identity a inc b))

(sum 1 10)
(product 1 7)
