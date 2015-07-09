;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.4.2) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
;; interest-rate : number -> number
;; 给定存款额确定利率
(define (interest-rate amount)
  (cond
    [(<= amount 1000) 0.04]
    [(<= amount 5000) 0.045]
    [else 0.05]))

;; 时薪
(define HOURLY-PAY 12)

;; tax : number -> number
;; 毛收入->税款
(define (tax gross-income)
  (* gross-income (tax-rate gross-income)))

;; tax-rate : number -> number
;; 毛收入->税率
(define (tax-rate gross-income)
  (cond
    [(<= gross-income 240) 0]
    [(<= gross-income 480) 0.15]
    [else 0.28]))

;; hourly-pay : number -> number
;; 工作时数->周薪
(define (hourly-pay hours)
  (* hours HOURLY-PAY))

;; netpay : number -> number
;; 每周工作时数->净收入
(define (netpay hours)
  (- (hourly-pay hours) (tax (hourly-pay hours))))