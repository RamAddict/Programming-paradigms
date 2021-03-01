QUESTÃO 3

(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL)
                      :dir (make-no :n 32 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(setq arvoreParesImpares
    (make-no 
        :n 4
        :esq (make-no :n 2               ;pode omitir o NIL 
                      :esq (make-no :n 1 :esq NIL :dir NIL)
                      :dir (make-no :n 2 :esq NIL :dir NIL)
             )
        :dir (make-no :n 2 
                      :esq (make-no :n 1 :esq NIL :dir NIL) 
                      :dir (make-no :n 5 :esq NIL :dir NIL)
             ) 
    )
)

(setq testeArvoreDeBits
    (make-no 
        :n 2
        :esq (make-no :n 7               ;pode omitir o NIL 
                      :esq (make-no :n 7 :esq NIL :dir NIL)
                      :dir (make-no :n 0 :esq NIL :dir NIL)
             )
        :dir (make-no :n 5 
                      :esq (make-no :n 10 :esq NIL :dir NIL) 
                      :dir (make-no :n 10 :esq NIL :dir NIL)
             ) 
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+ 
            (no-n arv) 
            (soma (no-esq arv)) 
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or 
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x) 
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo 
            (no-n arv) 
            (minimo 
                (minimoElemento (no-esq arv)) 
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

(defun ocorrenciasElemento (arv x)
	(if (null arv)
		0
		(if (= (no-n arv) x)
			(+ 1 (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x))
			(+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x))
		)
	)
)

(defun maioresQueElemento (arv x)
	(if (null arv)
		0
		(if (> (no-n arv) x)
			(+ 1 (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x))
			(+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x))
		)
	)
)

(defun mediaElementos (arv)
	(/ (soma arv) (quantidade arv))
)

(defun quantidade (arv)
	(if (null arv)
		0
		(+ 1 (quantidade (no-esq arv)) (quantidade (no-dir arv)))
	)
)

(defun elementos (arv)
    (if (not (null arv))
        (cons (no-n arv) (append (elementos (no-esq arv)) (elementos (no-dir arv))))
    )
)

(defun substituir (arv x y)
	 (if (not (null arv))
        (progn
            (setf (no-n arv) (if (= (no-n arv) x) y (no-n arv)))
            (substituir (no-esq arv) x y)
            (substituir (no-dir arv) x y)
        )
    )
)

(defun posOrdem(arv)
    (if (not (null arv))
        (append (posOrder (no-esq arv)) (posOrder (no-dir arv)) (list (no-n arv)))
    )
)

(defun preOrdem(arv)
    (if (not (null arv))
        (append (list (no-n arv)) (preOrder (no-esq arv)) (preOrder (no-dir arv)))
    )
)

(defun emOrdem(arv)
    (if (not (null arv))
        (append (inOrder (no-esq arv)) (list (no-n arv)) (inOrder (no-dir arv)))
    )
)

(defun subtraiParesImpares (arv)
	(- (somaPares arv) (somaImpares arv))
)

(defun somaPares (arv)
	(if (null arv)
		0
		(if (= 0 (mod (no-n arv) 2))
			(+ (no-n arv) (somaPares (no-esq arv)) (somaPares (no-dir arv)))
			(+ (somaPares (no-esq arv)) (somaPares (no-dir arv)))
		)
	)
)

(defun somaImpares (arv)
	(if (null arv)
		0
		(if (/= 0 (mod (no-n arv) 2))
			(+ (no-n arv) (somaImpares (no-esq arv)) (somaImpares (no-dir arv)))
			(+ (somaImpares (no-esq arv)) (somaImpares (no-dir arv)))
		)
	)
)

(defun novoNo (y)
	(make-no 	:n y
				:esq NIL
				:dir NIL
		)
)

; // Devolve a altura da árvore binária
; // cuja raiz é r.

; int altura (arvore r) {
;    if (r == NULL) 
;       return -1; // altura da árvore vazia
;    else {
;       int he = altura (r->esq);
;       int hd = altura (r->dir);
;       if (he < hd) return hd + 1;
;       else return he + 1;
;    }
; }



(defun distanciaMediaFolhas (arv)

)

(defun distanciaFolha (arv)
	(if (and (null no-esq arv) (null no-dir arv))

	)
)

; INICIO DA 3C

(defun altura (arv)
	(if (and (null (no-esq arv)) (null (no-dir arv)))
		0
		(if (null (no-esq arv))
			(+ 1 (altura (no-dir arv)))
			(if (null (no-dir arv))
				(+ 1 (altura (no-esq arv)))
				(if (> (altura (no-esq arv)) (altura (no-dir arv)))
					(+ 1 (altura (no-esq arv)))
					(+ 1 (altura (no-dir arv)))
				)
			)
		)
	)
)

(defun nosMaisDistantesQue (arv n)
	(if (not (null arv))
		(if (>= (profundidade arv) n)
			(elementos arv)
			(append (nosMaisDistantesQue (no-esq arv) n) (nosMaisDistantesQue (no-dir arv) n))
		)
		NIL
	)
)

(defun profundidade (arv)
	(- (altura minhaArvore) (altura arv))
)

(defun elementos (arv)
    (if (not (null arv))
        (cons (no-n arv) (append (elementos (no-esq arv)) (elementos (no-dir arv))))
    )
)

; FIM DA 3C

;INICIO DA 3D

(setq testeArvoreDeBits
    (make-no 
        :n 2
        :esq (make-no :n 7               ;pode omitir o NIL 
                      :esq (make-no :n 7 :esq NIL :dir NIL)
                      :dir (make-no :n 0 :esq NIL :dir NIL)
             )
        :dir (make-no :n 5 
                      :esq (make-no :n 10 :esq NIL :dir NIL) 
                      :dir (make-no :n 10 :esq NIL :dir NIL)
             ) 
    )
)

(defun arvoreDeBits (arv)
	(if (not (null arv))
		(if (verificaFibonacci(no-n arv) 1)
			(progn
            	(setf (no-n arv) 1)
            	(arvoreDeBits (no-esq arv))
            	(arvoreDeBits (no-dir arv))
        	)
        	(progn
            	(setf (no-n arv) 0)
            	(arvoreDeBits (no-esq arv))
            	(arvoreDeBits (no-dir arv))
        	)
		)
	)
)

(defun verificaFibonacci (n i)
	(if (= n 0)
		T
		(if (> (- i 3) n)
			NIL
			(if (= (fibonacci i) n)
				T
				(verificaFibonacci n (+ i 1))
			)
		)
	)
	
)

(defun fibonacci(n)
	(if (or (= n 1) (= n 2))
		1
		( + ( fibonacci (- n 1) ) ( fibonacci (- n 2) ) )
    
    )
)



;FIM DA 3D

;INICIO DA 3A

(defun distanciaFolhas (arv n)
	(if (and (null (no-esq arv)) (null no-dir (arv)))
		(list n)
		(append (distanciaFolhas (no-esq arv) (+ n 1)) (distanciaFolhas (no-dir arv) (+ n 1))) 
	)
)

;FIM DA 3A


(defun main()
	(write-line (write-to-string (distanciaFolhas minhaArvore 0)))

    ;(write-line (write-to-string (nosMaisDistantesQue minhaArvore 1)))

    ;(write-line (write-to-string (arvoreDeBits testeArvoreDeBits)))
    ;(write-line (write-to-string testeArvoreDeBits))
       
)

(main)


; INICIO DA 3C

(defun altura (arv)
	(if (and (null (no-esq arv)) (null (no-dir arv)))
		0
		(if (null (no-esq arv))
			(+ 1 (altura (no-dir arv)))
			(if (null (no-dir arv))
				(+ 1 (altura (no-esq arv)))
				(if (> (altura (no-esq arv)) (altura (no-dir arv)))
					(+ 1 (altura (no-esq arv)))
					(+ 1 (altura (no-dir arv)))
				)
			)
		)
	)
)

(defun nosMaisDistantesQue (arv n)
	(if (not (null arv))
		(if (>= (profundidade arv) n)
			(elementos arv)
			(append (nosMaisDistantesQue (no-esq arv) n) (nosMaisDistantesQue (no-dir arv) n))
		)
		NIL
	)
)

(defun profundidade (arv)
	(- (altura minhaArvore) (altura arv))
)

(defun elementos (arv)
    (if (not (null arv))
        (cons (no-n arv) (append (elementos (no-esq arv)) (elementos (no-dir arv))))
    )
)

; FIM DA 3C

;INICIO DA 3D

(setq testeArvoreDeBits
    (make-no 
        :n 2
        :esq (make-no :n 7               ;pode omitir o NIL 
                      :esq (make-no :n 7 :esq NIL :dir NIL)
                      :dir (make-no :n 0 :esq NIL :dir NIL)
             )
        :dir (make-no :n 5 
                      :esq (make-no :n 10 :esq NIL :dir NIL) 
                      :dir (make-no :n 10 :esq NIL :dir NIL)
             ) 
    )
)

(defun arvoreDeBits (arv)
	(if (not (null arv))
		(if (verificaFibonacci(no-n arv) 1)
			(progn
            	(setf (no-n arv) 1)
            	(arvoreDeBits (no-esq arv))
            	(arvoreDeBits (no-dir arv))
        	)
        	(progn
            	(setf (no-n arv) 0)
            	(arvoreDeBits (no-esq arv))
            	(arvoreDeBits (no-dir arv))
        	)
		)
	)
)

(defun verificaFibonacci (n i)
	(if (= n 0)
		T
		(if (> (- i 3) n)
			NIL
		if (verificaCrescente listaNumeros)
		"nao-decrescente"
		(if (verificaDecrescente listaNumeros)
			"nao-crescente"
			"sem ordem"
		)
	)
)

(defun verificaCrescente (listaNumeros)
	(if (= 1 (elementos listaNumeros))
		T
		(if (< (car listaNumeros) (car (cdr listaNumeros)))
			(verificaCrescente (cdr listaNumeros))
			NIL
		)
	)
	
)

(defun verificaDecrescente (listaNumeros)
	(if (= 1 (elementos listaNumeros))
		T
		(if (> (car listaNumeros) (car (cdr listaNumeros)))
			(verificaDecrescente (cdr listaNumeros))
			NIL
		)
	)
	
)

;; Utilizamos o numero de elemntos como condição de parada da recursão
(defun elementos (lista)
	(if (null lista)
		0
		(+ 1 (elementos (cdr lista)))
	)
)

(defun main()
	(write-line (write-to-string (qualOrdem '(2 4 5 6))))
	(write-line (write-to-string (qualOrdem '(1 1 9 2))))
	(write-line (write-to-string (qualOrdem '(9 5 4 3))))
)

(main)

---------------------------------

QUESTÃO 4


