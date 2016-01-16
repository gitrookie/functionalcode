;;;Code:
(defun larger-square (x y z)
  "return larger of sum of square of three numbers"
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
	((and (< y x) (< y z)) (+ (* x x) (* z z)))
	;;((and (< z y) (< z y)) (+ (* y y) (* x x)))))
	(t (+ (* y y) (* x x)))))

;;; ex1.el ends here


(larger-square 7 2 3)
(defun p ()
  (p))


;; EmacsLisp uses Applicative order evaluation
(defun test (x y)
  (if (= x 0)
      0
    y))

(test 0 (p))

;; Newton's Method for finding square root
(defun square-root (x) (square-iter x 1))
;;(setq guess 1.0)

(defun square-iter (x guess)

  (defun good-enoughp ()
    (if (< (abs (-  x (square guess))) 0.00001)
	t
      nil))

  (defun improved-guess()
    (setq guess (/ (+ guess (/ x guess)) 2)))
  
  (if (good-enoughp)
      guess
    (square-iter x (improved-guess))))
  
(defun square (x)
  (* x x))

;;(square-root 2)

;; Factorial of a number
(defun factorial (n)
  (if (or (= n 0) (= n 1))
      1
    (* n (factorial (- n 1)))))


;; Modified Factorial of a number
;; Following function will be tail recursive if the language supports tail call
;; optimization 
(defun factorial-mod (n)
  (defun factorial-iter (result n)
    (if (= n 0)
	result
      (setq result (* result n))
      (setq n (- n 1))
      (factorial-iter result n)))
  (factorial-iter 1 n))

(factorial-mod 3)
