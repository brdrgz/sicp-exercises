;;; package --- exercises-5.el
;;; Commentary:

;;; Code:

;; Exercise 1.16
(defun fast-expt-it (b n)
  "Calculate B^N iteratively."
  (cond ((= (% n 2) 0) (fast-expt-iter (* b b) (/ n 2) 1))
        (t (* b (fast-expt-iter (* b b) (/ (- n 1) 2) 1)))))

(defun fast-expt-iter (b n a)
  "Support function for fast-expt-it B, N, A."
  (cond ((= n 1) (* a b))
        ((= n 0) 1)
        (t (fast-expt-iter b
                           (- n 1)
                           (* a b)))))

;; Exercise 1.17
(defun double (a)
  "Support function for fast-mult, doubling A."
  (* a 2))

(defun halve (a)
  "Support function for fast-mult, halving A."
  (/ a 2))

(defun fast-mult (a b)
  "Calculate A * B recursively."
  (cond ((or (= b 0) (= a 0)) 0)
        ((= a 1) b)
        ((= b 1) a)
        ((= (% b 2) 0) (fast-mult (double a) (halve b)))
        (t (+ a (fast-mult a (- b 1))))))

;; Exercise 1.18
(defun fast-mult2 (a b)
  "Calculate A * B iteratively."
  (fast-mult2-iter a b 0))

(defun fast-mult2-iter (a b z)
  "Support function for fast-mult2 -- A, B, Z."
  (cond ((or (= b 0) (= a 0)) z)
        ((= (% b 2) 0) (fast-mult2-iter (double a) (halve b) z))
        (t (fast-mult2-iter a (- b 1) (+ z a)))))

;; Exercise 1.19
;; Given the state transformation T_pq(a, b) defined as
;;
;;   a <- bq + aq + ap
;;   b <- bp + aq
;;
;; Then, T_pq(T_pq(a, b)) becomes
;;
;;   a <-
;;      (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;;      = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;;      = b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)
;;
;;   b <-
;;      (bp + aq)p + (bq + aq + ap)q
;;      = bp^2 + apq + bq^2 + aq^2 + apq
;;      = b(p^2 + q^2) + a(2pq + q^2)
;;
;; And we can redefine T_pq(T_pq(a, b)) as T_p'q'(a, b), s.t.
;;
;;   a <- bq' + aq' + ap'
;;   b <- bp' + aq'
;;
;;   where p' = p^2 + q^2 and q' = 2pq + q^2

(defun fib-ss (n)
  "Calculate fib(N) using successive squaring."
  (fib-ss-iter 1 0 0 1 n))

(defun fib-ss-iter (a b p q count)
  "Support function for iterative fib-ss A,B,P,Q,COUNT."
  (cond ((= count 0) b)
        ((= (% count 2) 0)
         (fib-ss-iter a
                      b
                      (+ (* p p) (* q q))
                      (+ (* 2 p q) (* q q))
                      (/ count 2)))
        (t (fib-ss-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(provide 'exercises-5)
;;; exercises-5.el ends here
