;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname hw) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
;; area-of-disk number -> number
;; 计算圆的面积
;; eg: (area-of-disk 3) -> 
(define (area-of-disk r)
  (* 3.14 (* r r)))

;; area-of-ring number number -> number
;; 计算外径为outer，内径为inner的环的面积
;; eg: (area-of-ring 5 3) -> 50.24
(define (area-of-ring outer inner)
  (- (area-of-disk outer) (area-of-disk inner)))

(define (Fahrenheit->Celsius degree)
  (/ (- degree 32) 1.8))

(define (triangle width height)
  (/ (* width height) 2))

(define (convert3 num1 num2 num3)
  (+ num1 (* num2 10) (* num3 100)))

(define (f n)
  (+ (/ n 3) 2))