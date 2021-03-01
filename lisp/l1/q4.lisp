
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

(defun main()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (myXor x y)))
    ;; (setq y (read))
)





(main)