(define (square x)
  (* x x))


(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (mod x)
  (cond ((< x 0) (- x))
	(else x)))

(define (modif x)
  (if (< x 0)
      (- x)
      x))
