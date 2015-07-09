;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7.4.6) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct circle (center radius color))
(define-struct rectangle (nw width height color))

(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (draw-a-rect a-rect)
  (draw-solid-rect (rectangle-nw a-rect)
                  (rectangle-width a-rect)
                  (rectangle-height a-rect)
                  (rectangle-color a-rect)))

(define (clear-a-circle a-circle)
  (clear-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (clear-a-rect a-rect)
  (clear-solid-rect (rectangle-nw a-rect)
                  (rectangle-width a-rect)
                  (rectangle-height a-rect)
                  (rectangle-color a-rect)))

(define (draw-shape a-shape)
  (cond
    ((circle? a-shape) (draw-a-circle a-shape))
    ((rectangle? a-shape) (draw-a-rect a-shape))))

(define (clear-shape a-shape)
  (cond
    ((circle? a-shape) (clear-a-circle a-shape))
    ((rectangle? a-shape) (clear-a-rect a-shape))))

(define (translate-circle a-circle delta)
  (make-circle 
   (make-posn (+ (posn-x (circle-center a-circle)) delta)
              (posn-y (circle-center a-circle)))
   (circle-radius a-circle)
   (circle-color a-circle)))

(define (translate-rectangle a-rectangle delta)
  (make-rectangle
   (make-posn (+ delta (posn-x (rectangle-nw a-rectangle)))
              (posn-y (rectangle-nw a-rectangle)))
   (rectangle-width a-rectangle)
   (rectangle-height a-rectangle)
   (rectangle-color a-rectangle)))

(define (translate-shape delta a-shape)
  (cond
    ((circle? a-shape) (translate-circle a-shape delta))
    ((rectangle? a-shape) (translate-rectangle a-shape delta))))

(define (draw-and-clear-shape a-shape)
  (cond
    ((circle? a-shape)
     (and
      (draw-a-circle a-shape)
      (sleep-for-a-while 1)
      (clear-a-circle a-shape)))
    ((rectangle? a-shape)
     (and
      (draw-a-rect a-shape)
      (sleep-for-a-while 1)
      (clear-a-rect a-shape)))))

(define (move-shape delta a-shape)
  (cond
  ((draw-and-clear-shape a-shape) (translate-shape delta a-shape))
  (else a-shape)))

(start 200 200)
(draw-shape
 (move-shape 10
             (move-shape 10
                         (move-shape 10
                                     (move-shape 10 (make-rectangle (make-posn 20 20) 20 30 'red))))))

(draw-shape
 (move-shape 10
             (move-shape 10
                         (move-shape 10
                                     (move-shape 10 (make-circle (make-posn 20 20) 20 'red))))))