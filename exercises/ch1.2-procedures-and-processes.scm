;; 1B Procedures and Processes
;; Create a mechanical model for how the machine performs the
;; substitution

(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

;; Linear time and space for recursion of plus

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus x y)
  (if (= x 0)
      y
      (plus (dec x) (inc y))))

(plus 3 4)


(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product))))
