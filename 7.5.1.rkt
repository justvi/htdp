;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.5.1) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; area-of-disk : number -> number
;; 计算半径为r的圆的面积
(define (area-of-disk r)
  (* pi (sqr r)))

;; check-area-of-disk : number -> number
;; 计算面积前检查参数
(define (check-area-of-disk r)
  (cond
    ((and (number? r) (> r 0)) (area-of-disk r))
    (else (error 'check-area-of-disk "number expected"))))

