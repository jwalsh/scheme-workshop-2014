;; Black-box abstraction

(define a
  (* 5 5))

(define b (+ a (* 5 a)))

b

;; symbol definition
(define square
  (lambda (x) (* x x)))

(square 5)

;; procedure definition
(define (sqr x) (* x x))

(sqr 5)

(define (average x y)
  (/ (+ x y) 2))
(define (mean-square x y)
  (average (sqr x) (sqr y)))

(mean-square 10 100)

(define (abs x)
  (cond ((< 0 x) (- x))
        ((= 0 x) 0)
        ((> 0 x) x)))


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
