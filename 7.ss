;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 7 Solution
; by Eli Spiro
; December 21, 2009


; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
; 
; What is the 10001st prime number?


(define (prime? x)
  (local[(define (prime-helper num divisor)
           (cond[(> divisor (sqrt num)) true]
                [(zero? (remainder num divisor)) false]
                [else (prime-helper num (add1 divisor))]))]
    (prime-helper x 2)))

(define (find-nth-prime n)
  (local[(define (find-nth-prime-helper target-n current-n current-number)
           (cond[(= target-n current-n) (sub1 current-number)]
                [(prime? current-number) (find-nth-prime-helper target-n (add1 current-n) (add1 current-number))]
                [else (find-nth-prime-helper target-n current-n (add1 current-number))]))]
    (find-nth-prime-helper n 0 2)))

(find-nth-prime 10001)