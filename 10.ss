;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 10 Solution
; by Eli Spiro
; December 23, 2009


; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
; 
; Find the sum of all the primes below two million.


(define (prime? x)
  (local[(define (prime-helper num divisor)
           (cond[(> divisor (sqrt num)) true]
                [(zero? (remainder num divisor)) false]
                [else (prime-helper num (add1 divisor))]))]
    (prime-helper x 2)))

(define (sum-of-primes max)
  (foldr + 0 (filter prime? (build-list (- max 2) (lambda (x) (+ x 2))))))

(sum-of-primes 2000000)

;; This solution should be made more efficient.