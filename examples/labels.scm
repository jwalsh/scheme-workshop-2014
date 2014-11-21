(let ((x (list ’a ’b ’c)))
  (set-cdr! (cddr x) x)
  x)
