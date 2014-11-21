(define (factorial x)
  (if (< x 2)
    1
    (* x (factorial (- x 1)))))

(do ((i 0 (+ i 1)))
  ((> i 16))
    (display (string-append (number->string i) "! = "))
    (display (number->string (factorial i)))
    (newline))
