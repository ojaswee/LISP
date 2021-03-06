#|
Name: Ojaswee Dhungana
LISP Language 

create an array of random integers and a target number, then find all subsets of the integers 
that add up to the target number. Print the numbers and print the original indices of the numbers. 
|#

;(load "c:/users/UserName/FILELOCATION/Subset_problem.lisp")

(let ((solutions 0) flags numbers)
	(defun found-solution();Called when found a solution"
		(let ((total 0))
			(format t "  ")
			(dotimes (i (length numbers))
				(when (aref flags i)
					(incf total (aref numbers i))
					(format t "~A" (aref numbers i))
					(format t "(~A) " i )))
			(format t " => ~A~%" total)
			(incf solutions)))

	(defun find-solutions(k target-sum callback) ;algorithm to find a solution
		(when (zerop target-sum) ; zerop returns true if result is zero
			(funcall callback)
			(return-from find-solutions))
		(unless (= k (length numbers))
			(let ((nk (aref numbers k)))
				(when (>= target-sum nk)
				;; try subtracting numbers[k] from target-sum
				(setf (aref flags k) t)
				(find-solutions (+ 1 k) (- target-sum nk) callback)
				(setf (aref flags k) nil)))
			;; recurse without subtracting first
			(find-solutions (+ 1 k) target-sum callback))) 

	(defun find-subset-sum(target-sum) ;counts total how many solutions were found
		(setf flags (make-array (list (length numbers))))
		(setf solutions 0)
		(find-solutions 0 target-sum #'found-solution)
		(format t "Found ~A different solutions.~%" solutions))

	(defun subset-sum-test(size) ;this section is like main in C++
		(let* ((total 0) target-sum)
		;; int numbers array with random values up to 10
			(setf numbers (make-array (list size)))
			(dotimes (i size)
				(setf (aref numbers i) (random 10))
				(incf total (aref numbers i)))
			(print numbers)  ; show what array was created
			(setf target-sum 16) ;; change target sum here
			(format t "~%list all subsets of ~A:~%" target-sum)
			(find-subset-sum target-sum)))
)
(subset-sum-test 10) ; number of elements in array
