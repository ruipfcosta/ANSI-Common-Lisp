;;;; Using only operators introduced in this chapter, define a function that takes 
;;;; a list as an argument and returns true if one of its elements is a list.

;;; Recursion
(defun contains-list-1 (list)
  (if list
    (if (listp (car list))
      t
      (contains-list-1 (cdr list)))
    nil))


;;; Iteration
(defun contains-list-2 (list)
  (let ((list-found nil))
    (dolist (element list)
      (when (listp element)
        (setf list-found t)))
    list-found))
