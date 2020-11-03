(define (double f)
  (lambda (x)
    (f (f x))))

;; test
(define (inc x) (+ x 1))
((double inc) 1) ;; 3

(((double (double double)) inc) 5) ;; 21
