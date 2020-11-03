;; add
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

;; substract
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

;; multiply
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

;; divide
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

;; equal
(define (equal-rat x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; construct a rational number
;; (define make-rat cons)
(define (make-rat x y)
  (cons x y))

;; (define numer car)
(define (numer x)
  (car x))

;; (define denom cdr)
(define (denom x)
  (cdr x))
