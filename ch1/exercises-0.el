;;; Exercises --- Chapter 1

;; Exercise 1.1

;; 10
;; 12
;; 8
;; 3
;; 6
;; 3
;; 4
;; 19
;; #f
;; 4
;; 16
;; 6
;; 16


;; Exercise 1.2

;; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))


;; Exercise 1.3

;; (defun sum-of-larger-squares (a b c)
;;   (cond ((and (<= a b) (<= a c))
;;             (+ (* b b) (* c c)))
;;         ((and (<= b a) (<= b c))
;;             (+ (* a a) (* c c)))
;;         ((and (<= c a) (<= c b))
;;             (+ (* a a) (* b b)))))

;; Exercise 1.4

;; The function calculates the sum of a and the absolute value of b.
;; Using applicative-order evaluation, the operator is first determined
;; to be either + or -, depending on the value of b, and then the operator
;; is applied to the operands.


;; Exercise 1.5
;; Using applicative-order evaluation, the program will loop infinitely,
;; or encounter a run-time error due to the incorrect definition of p.
;; Using normal-order evaluation, the program will return 0.
;; The difference is that using normal-order evaluation, the interpreter
;; will first attempt to reduce (test 0 (p)), e.g. ((if (= x 0) 0 y) 0 (p)) ...
;; However, if the interpreter uses applicative-order evaluation, the operands
;; will be evaluated first, at which point evaluating (test 0 (p)) will fail
;; due to the self-referential definition of (p).
