;; if n < 3, f(n) = n
;; else f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)

(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
	 (* 2 (recursive-f (- n 2)))
	 (* 3 (recursive-f (- n 3))))))

(define (iterative-f n)
  (define (f-iter t1 t2 t3 counter)
    (if (= n counter)
	t1
	(f-iter (+ t1
		   (* 2 t2)
		   (* 3 t3))
		t1
		t2
		(+ counter 1))))
  (if (< n 3)
      n
      (f-iter 4 2 1 3)))

(recursive-f 1)
(iterative-f 1)
(recursive-f 2)
(iterative-f 2)
(recursive-f 3)
(iterative-f 3)
(recursive-f 4)
(iterative-f 4)
(recursive-f 5)
(iterative-f 5)
(recursive-f 6)
(iterative-f 6)
(recursive-f 7)
(iterative-f 7)
	      
