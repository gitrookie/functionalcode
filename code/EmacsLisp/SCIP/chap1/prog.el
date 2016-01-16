;; Fibonacci Series: 0, 1, 1, 2, 3, 5, 8

(defun fib (n)
  "Fibonacci Series"
  (cond ((= n 0) 0)
	((= n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))
	))

(fib 7)

