(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (average x y z)
  (/ (+ x y z) 3.0))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (average (f (- x dx))
               (f x)
               (f (+ x dx))))))

(define (n-fold-smooth f n)
  (repeated smooth n) f)
