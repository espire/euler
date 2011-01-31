;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 6 Solution
; by Eli Spiro
; December 22, 2009


; The sum of the squares of the first ten natural numbers is,
; 
; 12 + 22 + ... + 102 = 385
; The square of the sum of the first ten natural numbers is,
; 
; (1 + 2 + ... + 10)2 = 552 = 3025
; Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
; 
; Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


;; sum-of-squares: num -> num
;; returns the sum of the squares of all natural numbers up to x
(define (sum-of-squares x)
  (cond[(zero? x) 0]
       [else (+ (* x x) (sum-of-squares (sub1 x)))]))

;; square-of-sum: num -> num
;; returns the sum of the squares of all natural numbers up to x
(define (square-of-sum x)
  (local[(define (sum x)
           (cond[(zero? x) 0]
                [else (+ x (sum (sub1 x)))]))]
    (* (sum x) (sum x))))

(- (sum-of-squares 100) (square-of-sum 100))