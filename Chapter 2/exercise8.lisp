;;;; Give iterative and recursive definitions of a function that
;;;;    (a) takes a positive integer and prints that many dots.
;;;;    (b) takes a list and returns the number of times the symbol a occurs in it.

;;; Recursion
(defun print-dots-1 (count)
  (when (> count 0)
    (format t ".")
    (print-dots-1 (- count 1))))

(defun count-occurrences-1 (list x)
  (when list
    (let ((found 0))
      (if (eq (car list) x)
        (setf found 1))
      (+ found (count-occurrences-1 (cdr list) x)))))

;;; Iteration
(defun print-dots-2 (count)
  (do ((i 0 (+ i 1)))
      ((> i (- count 1)) t) ; Iterate from 0 until i > count -1
    (format t ".")))


(defun count-occurrences-2 (list x)
  (let ((count 0))
    (dolist (element list)
      (when (eq element x)
        (setf count (+ count 1))))
    count))
