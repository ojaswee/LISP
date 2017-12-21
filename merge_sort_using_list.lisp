
#|
Name: Ojaswee Dhungana

Implement a merge sort algorithm |#


;(load "c:/users/UserName/FILELOCATION/Subset_problem.lisp")

; define 2 list a and b; then give them random value between 0 to 100
(setf a nil)
(dotimes (i 10) (push (random 100) a))
(print a)

(setf b nil)
(dotimes (i 10) (push (random 100) b))
(print b)

;divide each list into individual elements
(defun list-head (lst n) (if (eq n 0) '() (cons (car lst) (list-head (cdr lst) (- n 1)))))
(defun list-tail (lst n) (if (eq n 0) lst (list-tail (cdr lst) (- n 1))))

; merge 2 list into 1 before sorting
(defun _merge (lst-a lst-b)
  (cond ((not lst-a) lst-b)
        ((not lst-b) lst-a)
        ((< (car lst-a) (car lst-b)) (cons (car lst-a) (_merge (cdr lst-a) lst-b)))
		;((= (car lst-a) (car lst-b))  (cons (car lst-a) (_merge (cdr lst-a) (cdr lst-b))))
        (T (cons (car lst-b) (_merge lst-a (cdr lst-b))))))

; sort each element 
(defun sortmerge (lst)
  (if (eq (length lst) 1)
    lst
    (_merge (sortmerge (list-head lst (truncate (length lst) 2)))
(sortmerge (list-tail lst (truncate (length lst) 2))))))

;(setf a (sortmerge a))
;(setf b (sortmerge b))

;(print a)
;(print b)

;(trace _merge)
;(untrace _merge)
(setf c (_merge a b))

(trace sortmerge)
(untrace sortmerge)
(setf c (sortmerge c))
(print c)
