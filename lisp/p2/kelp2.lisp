(defvar *maxValue* 4)

(defvar *puzzleSize* 5)

(defstruct L x elementos y)

(defstruct G linhas)

;; -- Um jogo corretamente resolvido para teste
(setq myCorrectGame (make-G
    :linhas (list
    (make-l
        :x 1
        :elementos '(5 3 1 4 2)
        :y 3
    )
    (make-l
        :x 4
        :elementos '(1 2 3 5 4)
        :y 2
    ) 
    (make-l
        :x 3
        :elementos '(3 4 5 2 1)
        :y 3
    ) 
    (make-l
        :x 2
        :elementos '(4 5 2 1 3)
        :y 0
    ) 
    (make-l
        :x 0
        :elementos '(2 1 4 3 5)
        :y 1
    ) 
    ;; colunas
    (make-l
        :x 0
        :elementos '(5 1 3 4 2)
        :y 0
    ) 
    (make-l
        :x 3
        :elementos '(3 2 4 5 1)
        :y 2
    ) 
    (make-l
        :x 3
        :elementos '(1 3 5 2 4)
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '(4 5 2 1 3)
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '(2 4 1 3 5)
        :y 1
    )
    )))

(setq testLine (make-L
    :x 4
    :elementos '(1 2 4 5 3)
    :y 2
    )
)

(defun allPossibleOptions ()
    (setq perm '())
    (if (= *maxValue* *puzzleSize*)
        (setq perm (permutations (createListFromTo 1 *maxValue*)))
        (setq perm (permutations (createListFromTo 0 (- *puzzleSize* 1) )))
    )
    perm

)

(defun createListFromTo (s f)
    (setq lista '())
    (loop for a from s to f
        do (setq lista (cons a lista))
)
    (reverse lista)
)


(defun repeatsElement (lista)
    (if (null lista)
        nil
        (or (elem (car lista) (cdr lista)) (repeatsElement (cdr lista)))
    )
)

(defun nPredios(lista)
    (if (null lista)
        0
        (progn
            (setq retorno 0)
            (setq maior 0)
            (dolist (i lista)
                (if (< maior i)
                    (progn
                        (setq maior i)
                        (setq retorno (+ 1 retorno))
                    )
                )
            )
            retorno
        )
    )    
)

(defun verificaLinha (linha)
    (and 
        (not (repeatsElement (l-elementos linha))) 
        (or (= (nPredios (l-elementos linha)) (l-x linha)) (= (l-x linha) 0))
        (or (= (nPredios (reverse (l-elementos linha))) (l-y linha)) (= (l-y linha) 0))
    )
)

(defun verificaJogo (jogo)
    (dolist (l (G-linhas jogo))
        (if (not (verificaLinha l)) (return-from verificaJogo Nil)))
    T
)

(defun elem (n lista)
    (if (null lista) nil
        (or (= (car lista) n) (elem n (cdr lista)))))

(defun checkSums (lista constant)
    (if (null lista) t
        (and (= constant (apply '+ (car lista))) (checkSums (cdr lista) constant))
    )
)

(defun checkMagic (matrix)
    (and    (checkSums matrix (apply '+ (car matrix)))
            (checkSums (transpose matrix) (apply '+ (car matrix)))
            (not (repeats (flatten matrix))))
)

(defun sumLine (lista n)
    (if (= n 3) (car lista)
        (+ (car lista) (sumLine (cdr lista) (+ n 1)))
    )
)

(defun tirarZeros (lista)
    (if (not (null lista))
        (if (= 1 (car lista))
            (cons 1 (tirarZeros (cdr lista)))
            (tirarZeros (cdr lista))
        )
    )
)

(defun getN (lista n)
    (if (not (null lista))
        (if (= n 1) (car lista)
        (getN (cdr lista) (- n 1))
        )
    )
)

(defun flatten (matrix)
    (if (not (null matrix))
        (append (car matrix) (flatten (cdr matrix)))
    )
)
(defun cars (matrix)
  (if (null matrix)
      nil
      (cons (car (car matrix)) (cars (cdr matrix)))))

(defun cdrs (matrix)
  (if (null matrix)
      nil
      (cons (cdr (car matrix)) (cdrs (cdr matrix)))))

(defun transpose (matrix)
  (cond ((null matrix) nil)
        ((null (car matrix)) nil)
        (t (cons (cars matrix) (transpose (cdrs matrix))))))

(defun printMatrix (matrix)
    (if (not (null matrix))
        (progn
            (print (car matrix))
            (printMatrix (cdr matrix))
        )
        (terpri )
    )
)

(defun permutations (list)
  (cond ((null list) nil)
        ((null (cdr list)) (list list))
        (t (loop for element in list
             append (mapcar (lambda (l) (cons element l))
                            (permutations (remove element list)))))))

(defun listToMatrix (lista)
    (if (not (null lista))
        (cons (subseq lista 0 3) (listToMatrix (cdddr lista)))
    )
)

(defun filtrar (func lista)
    (if (not (null lista))
        (if (funcall func (car lista))
            (cons (car lista) (filtrar func (cdr lista)))
            (filtrar func (cdr lista))
        )
    )
)

(defun checkPermutation (matrix)
    (and
        (checkSidePermutation matrix)
        (checkSidePermutation (transpose matrix)))
)

(defun getXY (matrix x y) (nth (- x 1) (nth (- y 1) (transpose matrix))))

(defun checkSidePermutation (matrix)
    (if (null matrix) t
        (and
            (equal '(1) (tirarZeros (car matrix)))
            (checkSidePermutation (cdr matrix)))
    )
)

(defun solveGame (jogo n)
    (if (= n (+ 1 *puzzleSize*))
        nil;; (if verificaJogo ())
        nil
    )

)


;; -- Pega determinada linha de um jogo
;; Recebe o vetor de linhas e não a estrutura de dados do jogos
;; 1 é o primeiro e depois da metade trata-se de colunas
(defun getLinhaG (n linhasJogo)
    (if (= 1 n)
        (car linhasJogo)
        (getLinhaG (- n 1) (cdr linhasJogo))
    )
)

;; retorna as linhas de um jogo
(defun extractLinhas (jogo)
    (G-linhas jogo)
)

;; Pega valores preenchidos de uma determinada linha
(defun getValues (linha)
    (L-elementos linha)
)

(defun getY (linha)
    (L-y linha)
)

(defun getX (linha)
    (L-x linha)
)

;; recebe um numero da coluna de 1 a puzzleSize
;; cria uma coluna a partir da lista de linhas e nao do jogo (tampouco da coluna ja pronta)
(defun philCollin (n linhasJogo)
    (setq linhaG (getLinhaG (+ n *puzzleSize*) linhasJogo))
    (setq ecs (getX linhaG))
    (setq why (getY linhaG))

    (setq acum '())
    (loop for i from *puzzleSize* downto 1
        do (setq acum (cons (getValues (getLinhaG i linhasJogo)) acum ))
    ) ; obtendo todas as linhas horizontais do jogo em acum
    ;; (print acum)
    (setq elem (philCollinHelper n acum))
    ;; (print elem)

    (make-l
    :x ecs
    :elementos elem
    :y why
    )
)

(defun philCollinHelper (n lista)
    (if (null lista)
        '()
        (progn
        ;; (print lista)
        ;; (print "oh")
        (cons (getN (car lista) n) (philCollinHelper n (cdr lista)))
        ;; (print "no")
        )
    )
)

;; (defun writeLineG (linhasJogo linha n) fix this
;;     (setq ac '())
;;     (loop for i from n downto 1
;;         do (if (= i 1)
;;             (setq ac (cons ac (cdr linhasJogo)))
;;             (setq ac (cons (car linhasJogo) ac))
;;         )
;;     )
;;     ac
;; )
;; (defun writeLineGOp (linhasJogo))

;; Dado as linhas, preenche as colunas com os valores correspondentes
;; (defun philAllCollins (jogo)
;;     (philAllCollinsOp jogo 1)
;; )

;; (defun philAllCollinsOp (jogo n)
;;     (setq ret jogo)
;;     (if (= (+ 1 *puzzleSize*) n)
;;         (setq ret jogo)
;;         (philAllCollinsOp)
;;     )
;;     ret
;; )


;; TRABALHANDO COM MATRIZES SEM A ESTRUTURA #2A
;; (mapcar 'printMatrix (filtrar 'checkMagic (mapcar 'listToMatrix (permutations '(1 2 3 4 5 6 7 8 9)))))
;; (print (checkPermutation correctPermutation))
;; (print (checkPermutation incorrectPermutation))
; (print (getXY correctMagicSquare 1 1))

(print *maxValue*)
(print *puzzleSize*)



(defun main()

    (print (nPredios '(2 4 1 3 5) ))
    (print (verificaLinha testLine))
    (print myCorrectGame)
    (print (verificaJogo myCorrectGame))
    (print (createListFromTo 1 4))
    (print (allPossibleOptions))
    (print (getLinhaG 1 (extractLinhas myCorrectGame)))
    (print (getValues testLine))
    (print (getY testLine))
    (print (philCollin 5 (extractLinhas myCorrectGame)))
    (print (writeLineG (extractLinhas myCorrectGame) '(5 4 1 2 3) 2))
)

(main)
