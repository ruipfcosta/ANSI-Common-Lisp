;;;; Using car and cdr, define a function to return the fourth element of a list.

(defun 4th (list)
  (car (cdr (cdr (cdr list)))))
