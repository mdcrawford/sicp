#lang sicp

;; Exercise 1.3

;; modularity: first, define a square function
(define (square x) (* x x))

;; next, sum-squares function
(define (sum-squares a b) (+ (square a) (square b)))

;; final function
(define (sum-squares-of-larger a b c)
  (cond ((and (>= a c) (>= b c)) (sum-squares a b))
        ((and (>= a b) (>= c b)) (sum-squares a c))
        (else (sum-squares b c))))
