
(defun eleva (x y)
    (expt x y)
)

(defun myAbs (x)
    (abs x)
)

(defun areaTriangulo (x y)
    (/ (* x y) 2)
)

(defun main()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (areaTriangulo x y)))
    ;; (setq y (read))
)





(main)