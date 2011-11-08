#lang racket

; Find the sum of all the multiples of 3 or 5 below 1000.

(define (sum num)
  (cond[(zero? num) 0]
       [(or (zero? (remainder num 5)) (zero? (remainder num 3)))
        (+ num (sum (sub1 num)))]
       [else (sum (sub1 num))]))

(sum 999)