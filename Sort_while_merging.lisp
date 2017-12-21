#|
Name: Ojaswee Dhungana
LISP language 
First sort 2 list , then before merging compare two values on these 2 list then sort again
|#

;(load "c:/users/UserName/FILELOCATION/Subset_problem.lisp")

; define a and b then randomly input 10 values upto 100
(setf a nil)
(dotimes (i 10) (push (random 100) a))
(print a)

(setf b nil)
(dotimes (i 10) (push (random 100) b))
(print b)


;; first sort a and b before merging 2 list using merge sort
(defun merge-sort (list); get a list to do merse sort
	(labels ((merge-aux (f s) ; divide list into 2 sections
				(cond
				((null f) s) ; if f is empty get s
				((null s) f) ; if s is empty get f
				((< (first f) (first s)) (list* (first f) (merge-aux (rest f) s)))
				((> (first f) (first s)) (list* (first s) (merge-aux f (rest s))))
				((= (first f) (first s)) (list* (first f)
												(merge-aux (rest f) (rest s))))
												)))
		(let ((len (list-length list)))
			(if (<= len 1) list
				(merge-aux (merge-sort (subseq list 0 (ceiling len 2)))
                   (merge-sort (subseq list (ceiling len 2))))))))

(setf a(merge-sort a))
(setf b(merge-sort b))

;; prnt a and b
(print a)
(print b)

;;Now merge-sort and combine a and b
(defun sortMerge (l1 l2) ; define merge sort to merge sort 2 list
   (cond 				; start of condition
     ((null l1) l2)		; if first list is empty input 2nd list
     ((null l2) l1)		; if 2nd list is empty input 1st list
     ((<(car l1) (car l2)) ; if first lst1<lst2 then input lst1
      (cons (car l1) (sortMerge (cdr l1) l2)))
	  ; if lst1=lst2 skip 1 of the value
	  ((= (car l1) (car l2)) (cons (car l1) (sortMerge (cdr l1) (cdr l2)))) 
     (t
      (cons (car l2) (sortMerge l1 (cdr l2))))))
				   
(setq c (sortMerge a b ))
(print c)