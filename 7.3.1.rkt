;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.3.1) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define (distance-to-0 a-pixel)
  (cond
    ((number? a-pixel) (- a-pixel 0))
    ((posn? a-pixel) (sqrt (+ (sqr (posn-x a-pixel)) (sqr (posn-y a-pixel)))))))

(define-struct square (nw length))
(define-struct circle (center radius))

(define (perimeter-circle a-circle)
  (* 2 pi (circle-radius a-circle)))

(define (perimeter-square a-square)
  (* 4 (square-length a-square)))

(define (area-circle a-circle)
  (* pi (sqr (circle-radius a-circle))))

(define (area-square a-square)
  (sqr (square-length a-square)))

(define (perimeter a-shape)
  (cond
    ((square? a-shape) (perimeter-square a-shape))
    ((circle? a-shape) (perimeter-circle a-shape))))

(define (area a-shape)
  (cond
    ((square? a-shape) (area-square a-shape))
    ((circle? a-shape) (area-circle a-shape))))

(perimeter (make-circle (make-posn 4 4) 0.5))
(perimeter (make-square (make-posn 4 4) 1))
(area (make-circle (make-posn 4 4) 1))
(area (make-square (make-posn 4 4) 4))