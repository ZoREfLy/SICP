(define (simpson-rule-integrate f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a
                       (* k h))))
  (define (sum summation term k)
    (cond ((= n k) (+ summation (yk k)))
          ((or (= term 1) (= term 2)) (sum (+ summation (* term (yk k)))
                                           4
                                           (+ k 1)))
          (else (sum (+ summation (* term (yk k)))
                     2
                     (+ k 1)))))
  (* (/ h 3)
     (sum 0 1 0)))

(define (cube x)
  (* x x x))

(simpson-rule-integrate cube 0 1 100)
(simpson-rule-integrate cube 0 1 1000)
