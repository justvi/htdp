;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.4.3) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
;; rate : number -> number
;; 消费额->奖励率
(define (rate consumption)
  (cond
    [(<= consumption 500) 0.0025]
    [(<= consumption 1500) 0.0050]
    [else 0.0075]))

;; pay-back : number -> number
;; 消费额->奖励金
(define (pay-back consumption)
  (cond
    [(<= consumption 500) (* consumption 0.0025)]
    [(<= consumption 1500) (+ (* 500 0.0025) (* (- consumption 500) 0.0050))]
    [(<= consumption 2500) (+ (* 500 0.0025) (* 1000 0.0050) (* (- consumption 1500) 0.0075))]
    [else (+ (* 500 0.0025) (* 1000 0.0050) (* 1000 0.0075) (* (- consumption 2500) 0.01))]))