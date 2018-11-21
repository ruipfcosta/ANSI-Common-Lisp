;;;; Define a function that takes a list and returns a list indicating the number of 
;;;; times each (eql) element appears, sorted from most common element to least common:
;;;;
;;;; > (occurrences '(a b a d a c d c a))
;;;; ((A . 4) (C . 2) (D . 2) (B . 1))

(defun occurrences (list)
  (let ((without-duplicates nil))
    ;; Use a set to determine what elements exist on the list
    (dolist (element list)
      (setf without-duplicates (adjoin element without-duplicates)))

    (let ((accumulator nil))
      (dolist (element without-duplicates)
        (let ((counter 0))
          (dolist (current list)
            (when (eql element current)
              (setf counter (+ counter 1))))

          (setf accumulator (append accumulator (list (cons element counter))))))

      ;; Sort accumulator entries
      (sort accumulator #'(lambda (x y) (> (cdr x) (cdr y)))))))
