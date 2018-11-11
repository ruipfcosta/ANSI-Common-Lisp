;;;; Define a function that takes two arguments and returns the greater of the two.

(defun greater-of-two (x y)
  (if (> x y)
      x
      (if (> y x)
          y
          nil)))  
