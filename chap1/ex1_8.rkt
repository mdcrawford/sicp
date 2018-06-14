#lang sicp

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve x guess)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (distance x y)
  (abs (- x y)))

(define (good-enough? x guess)
  (< (distance (cube guess) x) 0.0001))

(define (cube-root-iter x guess)
  (if (good-enough? x guess)
      guess
      (cube-root-iter x (improve x guess))))

(define (cube-root x)
  (cube-root-iter x 1.0))