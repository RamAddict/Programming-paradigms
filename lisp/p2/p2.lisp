(setq *maxValue* 5)

(setq *puzzleSize* 5)


(defstruct L x elementos y)


;; -- Um jogo corretamente resolvido para teste
(setq myCorrectGame 
    (list
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
    ))

(setq myHalfCorrectGame 
    (list
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
        :elementos '()
        :y 0
    ) 
    (make-l
        :x 4
        :elementos '()
        :y 1
    ) 
    ;; colunas
    (make-l
        :x 0
        :elementos '()
        :y 0
    ) 
    (make-l
        :x 3
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 3
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '()
        :y 1
    )
    ))

(setq myEmptyGame
    (list
    (make-l
        :x 1
        :elementos '()
        :y 3
    )
    (make-l
        :x 4
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 3
        :elementos '()
        :y 3
    ) 
    (make-l
        :x 2
        :elementos '()
        :y 0
    ) 
    (make-l
        :x 0
        :elementos '()
        :y 1
    ) 
    ;; colunas
    (make-l
        :x 0
        :elementos '()
        :y 0
    ) 
    (make-l
        :x 3
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 3
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '()
        :y 2
    ) 
    (make-l
        :x 0
        :elementos '()
        :y 1
    )
    ))

(setq testLine (make-L
    :x 4
    :elementos '(1 2 ROLa 5 4)
    :y 2
    )
)

(defun allPossibleOptions ()
    (if (= *maxValue* *puzzleSize*)
        (setq perm (permutations (createListFromTo 1 *maxValue*)))
        (setq perm (permutations (createListFromTo 0 (1- *puzzleSize*))))
    )
    perm

)
;; Pega, dentre todas as possibilidade de soluções de uma linha, aquelas que são válidas
(defun getOptions (linha)
    ;; (print linha)
    (setq ecs (l-x linha))
    (setq why (l-y linha))
    (setq allOptions (allPossibleOptions))
    (setq validOptions '())
    (loop for i in allOptions
        do
        (if (verificaLinha (make-l :x ecs :elementos i :y why))
            (setq validOptions (cons i validOptions))
        )
    )
    validOptions
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
    (setq retorno 0)
    (setq maior 0)
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

(defun verificaLinha (linhaV)
    (and 
        (not (repeatsElement (l-elementos linhaV))) 
        (or (= (nPredios (l-elementos linhaV)) (l-x linhaV)) (= (l-x linhaV) 0))
        (or (= (nPredios (reverse (l-elementos linhaV))) (l-y linhaV)) (= (l-y linhaV) 0))
    )
)

(defun verificaJogo (jogo)
    (loop for l in jogo do
        (if (not (verificaLinha l)) (return-from verificaJogo Nil)))
    T
)

(defun elem (n lista)
    (if (null lista) nil
        (or (= (car lista) n) (elem n (cdr lista)))))


(defun getN (lista n)
    (if (not (null lista))
        (if (= n 1) (car lista)
        (getN (cdr lista) (- n 1))
        )
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

(defun getColumnsX (jogo)
    (setq retorno '())
    (loop for i from 1 to *puzzleSize*
        do (cons (getX (getLinhaG (+ i *puzzleSize*) jogo)) retorno)
    )
    retorno
)

(defun getColumnsY (jogo)
    (setq retorno '())
    (loop for i from 1 to *puzzleSize*
        do (cons (getY (getLinhaG (+ i *puzzleSize*) jogo)) retorno)
    )
    retorno
)

(defun printGame (jogo)
    (print "--------------------")
    (print (getColumnsX jogo))
    (loop for i from 1 to *puzzleSize*
        do (format t "~d ~s ~d" (getX (getLinhaG i jogo)) (getValues (getLinhaG i jogo)) (getY (getLinhaG i jogo)))
    )
    (print (getColumnsY jogo))
    (print "--------------------")
)

(defun permutations (list)
  (cond ((null list) nil)
        ((null (cdr list)) (list list))
        (t (loop for element in list
             append (mapcar (lambda (l) (cons element l))
                            (permutations (remove element list)))))))

;; -- Pega determinada linha de um jogo
;; Recebe o vetor de linhas e não a estrutura de dados do jogos
;; 1 é o primeiro e depois da metade trata-se de colunas
(defun getLinhaG (n linhasJogo)
    (if (= 1 n)
        (car linhasJogo)
        (getLinhaG (- n 1) (cdr linhasJogo))
    )
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
    (setq elem '())

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

;; Performs a hard substitution of an element in a list
;; modifies the underlying list
(defun HARDwriteLineG (linhasJogo linha n)
    (setf (nth (- n 1) linhasJogo) linha)
    linhasJogo
)
;; Performs a copy of the list inserting the elem at the nth position
;; returns the modified copy 
(defun writeLineG (listu elemt n)
  (cond
    ((null listu) ())
    ((= n 1) (cons elemt (cdr listu)))
    (t (cons (car listu) (writeLineG (cdr listu) elemt (1- n)))))
)

;; Dado as linhas, preenche as colunas com os valores correspondentes
(defun philAllCollins (jogo)
    (setq retorno jogo)
    (loop for i from 1 to *puzzleSize*
        do (setq retorno (writeLineG retorno (philCollin i retorno) (+ i *puzzleSize*)))
    )
    retorno
)

(defun solveGame (jogo)
    (setq linhaAtual '())
    (loop for i from 1 to *puzzleSize*
        do (setq linhaAtual (getLinhaG i jogo))
            (if (null (getValues linhaAtual))
               (gameBackTrack jogo (getOptions linhaAtual) i)
            )
    )
    (setq jogo (philAllCollins jogo))
    (if (verificaJogo jogo) (print 'qlqr) (print jogo))
)

(defun gameBackTrack (thisGame opcoes n)
    (if (null opcoes) nil
        (progn 
            ;; (format t "~s da ~d linha " opcoes n)
            (setq lineX (getX (getLinhaG n thisGame)))
            (setq lineY (getY (getLinhaG n thisGame)))
            (setq testandoLinha (make-L
                :x lineX
                :elementos (car opcoes)
                :y lineY))
            ;; (print testandoLinha)
            (solveGame (writeLineG thisGame testandoLinha n))
            (setq testandoLinha (make-L
                :x lineX
                :elementos '()
                :y lineY))
            (gameBackTrack (writeLineG thisGame testandoLinha n) (cdr opcoes) n)
        )
    )
)

(defun main()
    ;; (print *maxValue*)
    ;; (print *puzzleSize*)
    ;; (print (nPredios '(2 4 1 3 5) ))
    ;; (print myCorrectGame)
    ;; (print (getLinhaG 10 myCorrectGame))
    ;; (print (verificaJogo myCorrectGame))
    ;; (print (createListFromTo 1 4))
    ;; (print (allPossibleOptions))
    ;; (print (getOptions testLine))
    ;; (print (getValues testLine))
    ;; (print (getY testLine))
    ;; (print (writeLineG (extractLinhas myCorrectGame) testLine 2))
    ;; (print (writeLineG myCorrectGame (make-L :x 666 :elementos '(6 6 9) :y 999) 8))
    ;; (print (extractLinhas myCorrectGame))
    ;; (print (philAllCollins (extractLinhas myCorrectGame)))
    ;; (print (solveGame myCorrectGame (+ 1 *puzzleSize*)))
    ;; (print (getLinhaG 2 myCorrectGame))
    ;; (print (verificaLinha testLine))
    ;; (proclaim '(optimize (debug 1)))
    ;; (SolveGame myHalfCorrectGame)
    ;; (print (philCollin 4 myHalfCorrectGame))
    ;; (print (philAllCollins myHalfCorrectGame))
    ;; (print myHalfCorrectGame)
    ;; (print myCorrectGame)

    (print (printGame myCorrectGame))
    ;; (solveGame myHalfCorrectGame)

)

(main)
