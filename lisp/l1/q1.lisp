
(defun eleva (x y)
    (expt x y)
)


(defun main()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (eleva x y)))
)





(main)