(define tolerance 0.00001)

(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (average x y)
  (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (pow a n)
  (define (iter i result)
    (if (> i n)
        1
        (iter (+ i 1) (* result a))))
  (iter 1 1))

(define (max-power n)
  (define (iter p r)
    (if (< (- n r) 0)
        (- p 1)
        (iter (+ p 1) (* r 2))))
  (iter 1 2))

(define (nth-root n x)
  (fixed-point (repeated average-damp (max-power n))
               (lambda (y) (/ x (pow y (- n 1))))
               1.0))
