;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cost) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
;; attendees: number -> number
;; 给定票价，计算观众数目
(define (attendees ticket-price)
  (+ 870 (* -150 ticket-price)))

;; revenue: number -> number
;; 给定票价，计算收入
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; cost: number -> number
;; 给定票价，计算支出
(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

(define (cost2 ticket-price)
  (* 1.5 (attendees ticket-price)))

;; profit: number -> number
;; 给定票价，计算收益为收入与支出的差
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))
