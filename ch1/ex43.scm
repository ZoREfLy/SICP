(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (lambda (x)
    (cond ((= n 0) x)
          ((odd? n) ((repeated f (- n 1)) (f x)))
          (else ((repeated f (- n 2)) ((compose f f) x))))))

;; better version
(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)
