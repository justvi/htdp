;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.6.12345) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct circle (center radius color))

(start 300 300)

(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) 
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (in-circle? a-circle a-posn)
  (>
   (circle-radius a-circle)
   (sqrt
    (+ 
     (sqr (- (posn-x a-posn) (posn-x (circle-center a-circle))))
     (sqr (- (posn-y a-posn) (posn-y (circle-center a-circle))))))))

(define (translate-circle a-circle delta)
  (make-circle
   (make-posn (+ (posn-x (circle-center a-circle)) delta)
              (posn-y (circle-center a-circle)))
   (circle-radius a-circle)
   (circle-color a-circle)))

(define (clear-a-circle a-circle)
  (clear-circle (circle-center a-circle)
                (circle-radius a-circle)
                (circle-color a-circle)))

(define (draw-and-clear-circle a-circle)
  (and
   (draw-a-circle a-circle)
   (sleep-for-a-while 1)
   (clear-a-circle a-circle)))

(define (move-circle delta a-circle)
  (cond
    ((draw-and-clear-circle a-circle) (translate-circle a-circle delta))
    (else a-circle)))

