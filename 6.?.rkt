;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.?) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define (distance-to-0 a-pixel)
  (cond
    ((number? a-pixel) (- a-pixel 0))
    ((posn? a-pixel) (sqrt (+ (sqr (posn-x a-pixel)) (sqr (posn-y a-pixel)))))))

(define-struct square (nw length))
(define-struct circle (center radius))

(define (perimeter a-shape)
  (cond
    ((square? a-shape) (* 4 (square-length a-shape)))
    ((circle? a-shape) (* 2 pi (circle-radius a-shape)))))

(define (area a-shape)
  (cond
    ((square? a-shape) (sqr (square-length a-shape)))
    ((circle? a-shape) (* pi (sqr (circle-radius a-shape))))))