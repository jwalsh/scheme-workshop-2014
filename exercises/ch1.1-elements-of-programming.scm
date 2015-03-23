;;{{{ Sigma

;; The goal is to support initial sigma notation
;; (sum identity 1 inc 5)
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum
	  term
	  (next a)
	  next
	  b))))

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(sum identity 1 inc 5)

(define (cube x)
  (* x x x))

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 0 10)

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000000))

;;}}}
