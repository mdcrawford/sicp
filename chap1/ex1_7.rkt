#lang sicp

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Looks like my computer can handle bigger numbers better than what this 1996
;; textbook expects, but I'd assume what they're getting at is that operations
;; like the division step in good-enough will cause problems as larger
;; numbers result in more digits being cut off from the result.

;; As numbers get smaller, so do their square roots, so after a while, the
;; 0.001 distance is too large relative to the square root estimates

(define (distance x y)
  (abs (- x y)))

;; general idea: take (guess / prev-guess) and see if it's +/- epsilon of 1
(define (better-good-enough? guess prev-guess x)
  (define proportion (/ guess prev-guess))
  (< (distance proportion 1) 0.000001))

(define (better-sqrt-iter guess prev-guess x)
  (if (better-good-enough? guess prev-guess x)
      guess
      (better-sqrt-iter (improve guess x) guess x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 0.0 x))

;; this implementation seems to work better for both bigger and smaller numbers