#lang sicp

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; applicative order: each of the arguments are fully evaluated,
;; causing an infinite loop as (p) will keep trying to access itself

;; normal-order: once the test runs, the if statement returns 0
;; without ever trying to "look inside" (p), so no infinite loop