(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (multiply a b)
  (cond ((or (= a 0) (= b 0)) 0)
	((= a 1) b)
	((= b 1) a)
	((even? b) (double (multiply a (halve b))))
	(else (+ a (multiply a (- b 1))))))
