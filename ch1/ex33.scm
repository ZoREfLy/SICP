
(define (accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (accumulate combiner null-value term (next a) next b filter))
          (combiner null-value
                    (accumulate combiner null-value term (next a) next b filter)))))

(define (accumulate-iter combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) (combiner result null-value)))))
  (iter a null-value))

;; Part a
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sqr x) (* x x))
(define (inc x) (+ x 1))
(define (sum-filter x) #t)

(define (sqr-prime-summation a b)
  (accumulate + 0 sqr a inc b prime?))
(define (iterative-sqr-prime-summation a b)
  (accumulate-iter + 0 sqr a inc b prime?))

(sqr-prime-summation 2 10)
(iterative-sqr-prime-summation 2 10)

;; Part b
(define (identity x) x)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relatively-prime-product n)
  (define (relatively-prime? x) (= (gcd x n) 1))
  (accumulate * 1 identity 1 inc n relatively-prime?))
(define (iterative-relatively-prime-product n)
  (define (relatively-prime? x) (= (gcd x n) 1))
  (accumulate-iter * 1 identity 1 inc n relatively-prime?))

(relatively-prime-product 5)
(relatively-prime-product 5)
