#lang scheme

(define tolerance 0.00001)
(define (square x) (* x x))
(define (good-enough? guess x)
  (< ( abs (- (square guess) x)) 0.001))

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess) 
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt-iterative x)
      ((iterative-improve (lambda (guess)
                        (< (abs (- (square guess) x)) 0.001))
                      (lambda (guess)
                        (/ (+ guess 
                              (/ x guess))
                           2.0))) x))

(define (fixed-point-iterative f first-guess)
  (iterative-improve (lambda (guess)
                       (let ((next ( f guess)))
                         (< (abs(- guess next)) tolerance))) f) first-guess)

(sqrt-iterative 3)

