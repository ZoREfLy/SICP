(define tolerance 0.00001)
(define dx 0.00001)

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

;; averaging successive approximations
(define (average-damp f)
  (lambda (x) (average x (f x))))

;; Newton's Method
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

;; solve square root by fixed point and averge damping
;; (define (sqrt-fix x)
;;  (fixed-point (average-damp (lambda (y) (/ x y)))
;;               1.0))
;;
;; solve square root by newton's method
;; (define (sqrt-newton-method x)
;;  (newton-method (lambda (y) (- (square y) x))
;;                 1.0))

;; further abstraction
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt-averge-damp x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt-newton-method x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

;; test
(fixed-point cos 1.0) ;; .7390822985224023
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0) ;; 1.2587315962971173
