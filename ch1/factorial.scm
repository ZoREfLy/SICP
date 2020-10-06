(define (recursive-factorial n)
  (if (= n 1)
      1
      (* n (recursive-factorial (- n 1)))))

(define (iterative-factorial n)
  (define (factorial-iter product counter)
    (if (> counter n)
	product
	(factorial-iter (* product counter)
			(+ counter 1))))
  (factorial-iter 1 1))

(recursive-factorial 5)
(iterative-factorial 5)
