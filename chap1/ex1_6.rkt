#lang sicp

;; Exercise 1.6
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; the issue is that when we use "if", only one of the two clauses end up being
;; evaluated.  here, both would end up being evaluated, and the inner sqrt-iter
;; would cause an infinite loop.  this is a result of applicative-order
;; evaluation.