;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.6.8) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct rectangle (position width height color))

(define example-rect1 (make-rectangle (make-posn 20 20) 260 260 'red))
(define example-rect2 (make-rectangle (make-posn 60 60) 180 180 'blue))

(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-position a-rectangle)
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

(start 300 300)
(draw-a-rectangle example-rect1)
(draw-a-rectangle example-rect2)

(define (in-rectangle? a-rect a-posn)
  (and
   (> (- (posn-x a-posn) (posn-x (rectangle-position a-rect))) 0)
   (< (- (posn-x a-posn) (posn-x (rectangle-position a-rect))) (rectangle-width a-rect))
   (> (- (posn-y a-posn) (posn-y (rectangle-position a-rect))) 0)
   (< (- (posn-y a-posn) (posn-y (rectangle-position a-rect))) (rectangle-width a-rect))))
   
(define (translate-rectangle a-rect delta)
  (make-rectangle
   (make-posn (+ delta (posn-x (rectangle-position a-rect))) 
              (posn-y (rectangle-position a-rect)))
   (rectangle-width a-rect)
   (rectangle-height a-rect)
   (rectangle-color a-rect)))

(define (clear-a-rectangle a-rect)
  (clear-solid-rect (rectangle-position a-rect)
                    (rectangle-width a-rect)
                    (rectangle-height a-rect)
                    (rectangle-color a-rect)))

(define (draw-and-clear-rectangle a-rect)
  (and
   (draw-a-rectangle a-rect)
   (sleep-for-a-while 1)
   (clear-a-rectangle a-rect)))

(define (move-rectangle delta a-rect)
  (cond
    ((draw-and-clear-rectangle a-rect)
     (translate-rectangle a-rect delta))
    (else a-rect)))

(draw-a-rectangle
 (move-rectangle 20
  (move-rectangle 20
   (move-rectangle 20
    (move-rectangle 20 example-rect2)))))