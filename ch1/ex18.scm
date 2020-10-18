(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-mul a b)
  (define (mul-iter x y z)
    (cond ((or (= x 0) (= y 0)) 0)
	  ((= x 1) (+ y z))
	  ((= y 1) (+ x z))
	  ((even? y) (mul-iter (double x) (halve y) z))
	  (else (mul-iter x (- y 1) (+ x z)))))
  (mul-iter a b 0))
