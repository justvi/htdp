;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.1.4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp")))))
(define (sub a b c)
  (- (* b b) (* 4 a c)))

(define (how-many-regular a b c)
  (cond
    [(> (sub a b c) 0) 'two]
    [(= (sub a b c) 0) 'one]
    [else 'none]))
  
(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [else (how-many-regular a b c)]))