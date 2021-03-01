
(defun eleva (x y)
    (expt x y)
)

(defun myAbs (x)
    (abs x)
)

(defun areaTriangulo (x y)
    (/ (* x y) 2)
)

(defun myXor (x y)
    (or(and (not x) y) (and (not y) x))
)

(defun passou (x y z)
    (setq media (/ (+ (+ x y) z) 3))
    (if (< media 6)
        Nil
    T)
)

(defun fib (n)
    (if  (<= n 1)
        1
    (+(fib (- n 1)) (fib (- n 2))))
)

(defun bhaskara (a b c)
    (setq delta (- (* b b) (* (* 4 a) c)))
    (/(- (sqrt delta) b) (* 2 a))
)

(defun main()
    (setq n (read))
    (setq y (read))
    (setq z (read))
    (write-line (write-to-string (bhaskara n y z)))
    ;; (write-line (write-to-string (- 0 (bhaskara n y z))))
    ;; (setq y (read))
)





(main)