(load "parallel.scm")

(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (+ x 1))))

(+ 0 x)
