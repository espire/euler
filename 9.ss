;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Project Euler
; Problem 9 Solution
; by Eli Spiro
; December 23, 2009


; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
; 
; a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
; 
; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.


(define (find-pythagorean-triple sum)
  (local[(define (find-pythagorean-triple-helper a b c sum)
           (cond[(and (pythagorean-triple? a b c)
                      (= (+ a b c) sum))
                 (* a b c)]
                [(= c sum) (find-pythagorean-triple-helper a (add1 b) (+ b 2) sum)]
                [(> b (/ sum 2)) (find-pythagorean-triple-helper (add1 a) (+ a 2) (+ a 3) sum)]
                [(= a sum) false]
                [else (find-pythagorean-triple-helper a b (add1 c) sum)]))]
    (find-pythagorean-triple-helper 1 2 3 sum)))


(define (pythagorean-triple? a b c)
  (and
   (ascending-order? a b c)
   (c-is-hypotenuse? a b c)))

(check-expect (pythagorean-triple? 3 4 5) true)
(check-expect (pythagorean-triple? 3 4 6) false)

(define (ascending-order? a b c)
  (and
   (< a b)
   (< b c)))

(define (c-is-hypotenuse? a b c)
  (= (+ (* a a) (* b b))
     (* c c)))

(find-pythagorean-triple 1000)