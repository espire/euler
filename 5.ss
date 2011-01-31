;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 5 Solution
; by Eli Spiro
; December 21, 2009


; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
; 
; What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?


(define (evenlydivisible? x)
  (cond[(and (= (remainder x 3) 0)
             (= (remainder x 5) 0)
             (= (remainder x 7) 0)
             (= (remainder x 9) 0)
             (= (remainder x 11) 0)
             (= (remainder x 13) 0)
             (= (remainder x 17) 0)
             (= (remainder x 16) 0)
             (= (remainder x 19) 0)) x]
       [else (evenlydivisible? (+ 20 x))]))

(evenlydivisible? 20)