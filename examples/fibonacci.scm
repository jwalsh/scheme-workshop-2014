(define (fibonacci x)
  (if (< x 2)
    x
    (+ (fibonacci (- x 1)) (fibonacci (- x 2)))))

(do ((i 1 (+ i 1)))
  ((> i 16))
    (display (string-append (number->string (fibonacci i)) ", ")))
(display "...")
(newline)
