
(defun eleva (x y)
    (expt x y)
)

(defun myAbs (x)
    (abs x)
)

(defun main()
    (setq x (read))
    (write-line (write-to-string (myAbs x)))
    ;; (setq y (read))
)





(main)