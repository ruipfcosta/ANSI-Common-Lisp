;;;; A friend is trying to write a function that returns the sum of all the non-nil
;;;; elements in a list. He has written two versions of this function, and neither
;;;; of them work. Explain what's wrong with each, and give a correct version:
;;;;
;;;; (a) (defun summit (lst)
;;;;       (remove nil lst)
;;;;       (apply #'+ lst))
;;;;
;;;; (b) (defun summit (lst)
;;;;       (let ((x (car lst)))
;;;;         (if (null x)
;;;;           (summit (cdr lst))
;;;;           (+ x (summit (cdr lst))))))

;;; The original function was applying the + function to the original list
;;; still containing nil values
(defun summit-1-fixed (lst)
  (apply #'+ (remove nil lst)))


;;; The original function didn't have a stop condition meaning it would result
;;; in an infinite loop. After adding that condition, it's also necessary to
;;; guarantee the function doesn't return nil, otherwise it will try to use nil
;;; as an argument to the + function.
(defun summit-2-fixed (lst)
  (if lst
    (let ((x (car lst)))
      (if (null x)
        (summit-2-fixed (cdr lst))
        (+ x (summit-2-fixed (cdr lst)))))
    0))
  