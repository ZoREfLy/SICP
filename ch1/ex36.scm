(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (x-to-the-x y)
  (fixed-point (lambda (x) (/ (log y) (log x)))
               10.0))

(x-to-the-x 1000)
