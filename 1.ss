;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 1 Solution
; by Eli Spiro
; December 21, 2009


;; sum: num
;; returns the sum of all the multiples 3 and 5 below 1000
(define (sum num)
  (local[(define (sum-helper num)
           (cond[(zero? num) 0]
                [(or (zero? (remainder num 5))
                     (zero? (remainder num 3))) (+ num (sum-helper (sub1 num)))]
                [else (sum-helper (sub1 num))]))]
  (sum-helper num)))

(sum 999)