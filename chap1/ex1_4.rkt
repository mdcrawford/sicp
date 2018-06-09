#lang sicp

;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; the operator is determined by if b > 0 (+) or if b <= 0 (-).
;; pretty neat!