;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9.1.34) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define (add-up-3 list)
  (+
   (first list)
   (first (rest list))
   (first (rest (rest list)))))

(define (distance-to-0 list)
  (sqrt
   (+
    (sqr (first list))
    (sqr (first (rest list)))
    (sqr (first (rest (rest list)))))))

(define (contains-2-doll list)
  (or
   (symbol=? (first list) 'doll)
   (symbol=? (first (rest list)) 'doll)))