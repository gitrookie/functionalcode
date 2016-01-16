;; Recursion in EmacsLisp

(defun factorial (x)
  (if (or (= x 0) (= x 1))
      1
    (* x (factorial (- x 1)))))

(factorial 5)



;;setq usage

(setq var 12)
(defun f1 ()
  ;;(setq var 12)
  (defun f2 ()
    (setq var 22)
    )
  (f2)
  var)

(f1)
(setq x 2)
(setq guess 1.0)
(setq guess (/ (+ guess (/ x guess)) 2))
(abs x 2)

(defun foo ()
  (setq var 12))

