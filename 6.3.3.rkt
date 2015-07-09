;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.3.3) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct jet (name rate hight-speed range))

(define (within-range a-jet distance)
  (> (jet-range a-jet) distance))

(define (reduce-range a-jet)
  (make-jet
   (jet-name a-jet)
   (jet-rate a-jet)
   (jet-hight-speed a-jet)
   (* (jet-range a-jet) 0.80)))