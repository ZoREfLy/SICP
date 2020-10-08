;; Pascal's triangle
(define (p r c)
  (if (or (= c 0) (= r c))
      1
      (+ (p (- r 1) c)
	 (p (- r 1) (- c 1)))))

(p 0 0)
(p 1 0)
(p 1 1)
(p 2 0)
(p 2 1)
(p 3 1)
(p 3 2)
(p 4 1)
(p 4 2)
(p 4 3)
(p 5 1)
(p 5 2)
      
