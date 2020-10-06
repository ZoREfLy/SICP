(define (max x y)
  (if (> x y)
      x
      y))

(define (sqr x)
  (* x x))

(define (sum-of-max-sqr x y z)
  (if (> x y)
      (+ (sqr x) (sqr (max y z)))
      (+ (sqr y) (sqr (max x z)))))

(define x 1)
(define y 2)
(define z 3)
(sum-of-max-sqr x y z)
