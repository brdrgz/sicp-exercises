;; Exercise 1.6

;; Due to applicative-order evaluation, the new-if will have
;; all of its arguments evaluated before it is applied.  What
;; this means is that the program will recurse infinitely,
;; since sqrt-iter will be applied before new-if is.


;; Exercise 1.7

;; The good-enough? predicate, will ironically _not_ be good
;; enough for small numbers, particuarly those that are less
;; than 0.001, approaching the epsilon value specified.
;; sqrt-new 0.001
;; 0.04124542607499115
;; sqrt-new 0.0001
;; 0.03230844833048122
;; sqrt-new 0.00001
;; 0.03135649010771716
;; sqrt-new 0.000001
;; 0.031260655525445276
;; ...
;; It is also simply non-functional for very large numbers such as
;; 10 trillion, since the call stack begins to grow excessively
;; sqrt-new 10000000000000
;; Lisp nesting exceeds ‘max-lisp-eval-depth’
;; The following change:
;; (defun sqrt-iter (guess x)
;; (if (or (good-enough? guess x)
;;         (< (abs (- (improve guess x) guess)) 0.0001))
;;    guess
;;    (sqrt-iter (improve guess x) x)))
;; works great for very large numbers, but is basically
;; non-functional for small numbers.
;; Decreasing the epsilon value by orders of magnitude increases
;; the effectiveness of the algorithm with small numbers, but
;; still doesn't make it possible to process values such as
;; 0.0001


;; Exercise 1.8

;; (defun improve (guess x)
;;   (/ (+ (/ x (square guess)) (* 2 guess)) 3))
;; ...
;; (defun cube-new (x)
;;    (sqrt-iter 1.0 x))
