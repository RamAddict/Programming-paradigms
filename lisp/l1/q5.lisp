
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

(defun main()
    (setq x (read))
    (setq y (read))
    (setq z (read))
    (write-line (write-to-string (passou x y z)))
    ;; (setq y (read))
)





(main)