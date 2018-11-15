;;;; Suppose the function pos+ takes a list and returns a list of each element plus its position:
;;;;
;;;; > (pos+ '(7 5 1 4)) 
;;;; (7 6 3 7)
;;;;
;;;; Define this function using (a) recursion, (b) iteration, (c) mapcar.

;;; Recursion
(defun pos+recursion (list)
  (when list
    ;; Determine the position based on the length of the cdr.
    ;; This means we are processing the list backwards!
    (let ((reversed-list (reverse list)))
      (let ((carPosition (length (cdr reversed-list))))
        ;; Add the position to the element at that position on the original list.
        ;; Since we are processing the list backwards, we need to keep appending 
        ;; the new results to beggining of the list as we go.
        (append (pos+recursion (reverse (cdr reversed-list))) (list (+ (nth carPosition list) carPosition)))))))

;;; Iteration
(defun pos+iteration (list)
  (let ((result nil))
    (do ((i 0 (+ i 1)))
      ((> i (- (length list) 1)))
      (let ((number (+ i (nth i list))))
        (setf result (append result (list number)))))
    result))

;;; Mapcar
(defun pos+mapcar (list)
  ;; Determine the positions by calculating length - 1 for
  ;; each cdr, and reversing the resulting list in the end
  (let ((positions (reverse (maplist #'(lambda (lst) (- (length lst) 1)) list))))
    (mapcar #'+ list positions)))
  