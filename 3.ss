;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 3 Solution
; by Eli Spiro
; December 22, 2009


; The prime factors of 13195 are 5, 7, 13 and 29.
; 
; What is the largest prime factor of the number 600851475143 ?


(define (largest-prime-factor x)
  (local[(define (largest-prime-factor-helper factor num)
           (cond[(= num factor) factor]
                [(zero? (remainder num factor))
                 (largest-prime-factor-helper (add1 factor) (/ num factor))]
                [else (largest-prime-factor-helper (add1 factor) num)]))]
    (largest-prime-factor-helper 1 x)))

(largest-prime-factor 600851475143)