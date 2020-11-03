(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

(define tolerance 0.00001)
(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (average x y)
  (/ (+ x y) 2.0))

(define (fixed-point f guess)
  ((iterative-improve (lambda (x)
                        (close-enough? x (f x)))
                      f)
   guess))

(define (sqrt x)
  ((iterative-improve (lambda (y)
                        (< (abs (- (square y) x)) 0.00001))
                      (lambda (y)
                        (average y (/ x y))))
   1.0))

(sqrt 4)
(sqrt 16)
(sqrt 100)
