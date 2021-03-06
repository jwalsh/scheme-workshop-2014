(define A (read))
(define B (read))
(define C (read))
(define D (- (* B B) (* 4 A C)))
(if (= A 0)
  (display "Not a quadratic equation.")
  (begin
   (define k1 (/ B -2 A))
   (define k2 (/ (sqrt (abs D)) 2 A))
   (if (= D 0)
    (begin (display "x = ") (display k1))
    (if (> D 0)
      (begin (display "x1 = ") (display (+ k1 k2)) (newline) (display "x2 = ") (display (- k1 k2)))
      (begin (display "x1 = (") (display k1) (display ", ") (display k2) (display ")") (newline)
             (display "x2 = (") (display k1) (display ", ") (display (- k2)) (display ")"))))))
