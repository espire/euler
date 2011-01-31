;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 4 Solution
; by Eli Spiro
; December 22, 2009


; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
; 
; Find the largest palindrome made from the product of two 3-digit numbers.


;; palindrome: num -> num
;; finds the largest palindrome made from the product of two 3-digit numbers
(define (palindrome length)
  (local[(define (palindrome-helper x y max)
           (cond[(> y 999) (palindrome-helper (add1 x) 1 max)]
                [(> x 999) max]
                [(> (* x y) max)
                 (cond[(equal? (int->list/reverse (* x y)) (reverse (int->list/reverse (* x y))))
                       (palindrome-helper x (add1 y) (* x y))]
                      [else (palindrome-helper x (add1 y) max)])]
                [else (palindrome-helper x (add1 y) max)]))]
    (palindrome-helper 1 1 1)))

(define (int->list/reverse num)
  (cond[(zero? num) empty]
       [else (cons (remainder num 10)
                   (int->list/reverse (quotient num 10)))]))

(palindrome 3)