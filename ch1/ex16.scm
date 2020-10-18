(define (iterative-fast-expt b n)
  (define (iter counter base a)
    (cond ((= counter 0) a)
	  ((even? counter) (iter (/ counter 2) (square base) a))
	  (else (iter (- counter 1) base (* a base)))))
  (iter n b 1))

(define (even? n)
  (= (remainder n 2) 0))

(iterative-fast-expt 2 1)
(iterative-fast-expt 2 2)
(iterative-fast-expt 2 3)
(iterative-fast-expt 2 4)
(iterative-fast-expt 2 5)
(iterative-fast-expt 2 10)
    
