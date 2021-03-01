
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

(defun existeTriangulo (a b c)
    (setq bc (- b c))
    (if (< bc a)
        (if (< a (+ b c))
            (if (< (- a c) b)
                (if (< b (+ a c))
                    (if (< (- a b) c)
                        (if (< c (+ a b))
                            T
                        Nil)
                    Nil)
                Nil)
            Nil)
        Nil)
    Nil)
)

(defun main()
    (setq n (read))
    (setq y (read))
    (setq z (read))
    (write-line (write-to-string (existeTriangulo n y z)))
    ;; (setq y (read))
)





(main)