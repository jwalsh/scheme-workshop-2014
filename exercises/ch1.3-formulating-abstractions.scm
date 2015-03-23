;;{{{  Iteration
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(factorial 5)

;;}}}

;;{{{ Generalize Sigma

;; Exercise 1.30.  The sum procedure above generates a linear
;; recursion. The procedure can be rewritten so that the sum is
;; performed iteratively.

(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a)
	      (+ (term a) result))))
  (iter a 0))

(sum2 identity 1 inc 5)

;; (accumulate combiner null-value term a next b)
(define (accumulator combine null-value term a next b)
  (if (> a b)
      (+ (combine a))))

;; Lambdas
(define plus4
  (lambda (x)
    (+ x 4)))

(plus4 6)


;;

(define (map2 list fn)
  (let* ((e (car list)))
    (if (null? e)
        nil
        (cons (fn e)
              (map2 (cdr list) fn)))))

(define listi '(1 2 3 4 5))

(map2 listi identity)

;;}}}
