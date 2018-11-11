;;;; Write a version of union that preserves the order of the elements in the original lists.
;;;;    > (new-union '(a b c) '(b a d)) 
;;;;    (A B C D)

(defun new-union (listA listB)
  (let ((new-list nil))
    (dolist (elementA listA)
      (when (not (member elementA new-list))
        (setf new-list (append new-list (list elementA)))))

    (dolist (elementB listB)
      (when (not (member elementB new-list))
        (setf new-list (append new-list (list elementB)))))
    
    new-list))
