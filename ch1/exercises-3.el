;;; package --- exercises-3.el
;;; Commentary:

;;; Code:

;; Exercise 1.11
(defun f_n (n)
  "Calculate f(N) recursively."
  (cond ((< n 3) n)
        (t
         (+ (f_n (- n 1))
            (* 2 (f_n (- n 2)))
            (* 3 (f_n (- n 3)))))))

(defun f_n_it (n)
  "Calculate f(N) iteratively."
  (f_n_iter 2 1 0 n))

(defun f_n_iter (a b c n)
       "Support function for f_n_it A, B, C, N."
       (cond ((< n 3) n)
             ((= n 3)
              (+ a (* 2 b) (* 3 c)))
             (t (f_n_iter (+ a (* 2 b) (* 3 c))
                          a
                          b
                          (- n 1)))))




;; Exercise 1.12
(defun pascal_element (n k)
  "Elements of Pascal's triangle at row N, column K (recursive)."
  (cond ((<= n 0) 1)
        ((<= k 0) 1)
        ((= n k) 1)
        ((< n 2) 1)
        (t (+ (pascal_element (- n 1) (- k 1)) (pascal_element (- n 1) k)))))

;; Exercise 1.13
;; Phi = (1 + sqrt(5))/2
;; Psi = (1 - sqrt(5))/2
;; Fib(0) = (Phi^0 - Psi^0)/sqrt(5) = 0
;; Fib(1) = (Phi - Psi)/sqrt(5) = (2*sqrt(5))/(2*sqrt(5)) = 1
;; If Fib(n) = (Phi^n - Psi^n)/sqrt(5)
;; and Fib(n-1) = (Phi^(n-1) - Psi^(n-1))/sqrt(5)
;; where n is a natural number,
;; then ...
;; Fib(n+1)
;; = Fib((n+1)-1) + Fib((n+1)-2)
;; = Fib(n) + Fib(n-1)
;; = (Phi^n - Psi^n)/sqrt(5) + (Phi^(n-1) - Psi^(n-1))/sqrt(5)
;; = (Phi^n - Psi^n + Phi^(n-1) - Psi^(n-1))/sqrt(5)
;; = [(Phi^n + Phi^(n-1)) - (Psi^n + Psi^(n-1))]/sqrt(5)
;; = [Phi^(n+1)*(Phi^(-1) + Phi^(-2)) - Psi^(n+1)*(Psi^(-1) + Psi^(-2))]/sqrt(5)
;; = [Phi^(n+1)*(2/(1+sqrt(5)) + 4/(1+sqrt(5))^2)
;;    - Psi^(n+1)*(2/(1-sqrt(5)) + 4/(1-sqrt(5))^2)]/sqrt(5)
;; = (Phi^(n+1) - Psi^(n+1))/sqrt(5)
;; Therefore, Fib(n) = (Phi^n - Psi^n)/sqrt(5) for all n >= 0.
;;
;; Since
;; abs(Phi^0/sqrt(5) - Fib(0))
;; = abs(Phi^0/sqrt(5) - (Phi^0 - Psi^0)/sqrt(5))
;; = abs(1/sqrt(5) - 0)
;; = 1/sqrt(5) < 0
;; then by definition of the "nearest integer" / "rounding" function,
;; (Phi^0 - Psi^0)/sqrt(5) is the nearest integer to Phi^0/sqrt(5).
;; and if (Phi^n - Psi^n)/sqrt(5) is the nearest integer to Phi^n/sqrt(5),
;; where n is a natural number, such that
;; abs(Phi^n/sqrt(5) - (Phi^n - Psi^n)/sqrt(5)) < 0.5, then
;; abs(Psi^n/sqrt(5)) < 0.5 and
;; abs(Phi^(n+1)/sqrt(5) - (Phi^(n+1) - Psi^(n+1))/sqrt(5))
;; = abs(Psi^(n+1)/sqrt(5))
;; = abs([(Psi^n)(Psi)]/sqrt(5))
;; = abs(Psi^n/sqrt(5)) * abs(Psi/sqrt(5)) < 0.5
;; Therefore, Fib(n) = (Phi^n - Psi^n)/sqrt(5) is the nearest integer
;; to Phi^n/sqrt(5) for all n >= 0.
;;
;; Q.E.D.

(provide 'exercises-3)
;;; exercises-3.el ends here
