;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10.3|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; 图形定义：形状，位置，大小，颜色
;;(define-struct size (width height))
;;(define-struct shst (shape position size color))

;;(define (draw-losh shapes)
;;  (cond
;;    ((empty? shapes) true)
;;    ((symbol=? (shst-shape (first shapes)) 'circle)
;;     (and
;;      (draw-circle 
;;      (shst-position (first shapes)) 
;;       (shst-size (first shapes)) 
;;       (shst-color (first shapes)))
;;      (draw-losh (rest shapes))))
;;    ((symbol=? (shst-shape (first shapes)) 'rectangle)
;;     (and
;;      (draw-solid-rect 
;;       (shst-position (first shapes))
;;       (size-width (shst-size (first shapes)))
;;       (size-height (shst-size (first shapes)))
;;       (shst-color (first shapes)))
;;      (draw-losh (rest shapes))))))

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

;; 10.3.1
;; list-of-shapes
;; 为空
;; 或者 (cons a-circle a-list-of-shapes)
;; 或者 (cons a-rectangle a-list-of-shapes)

(define FACE 
  (cons (make-circle (make-posn 50 50) 40 'red)
        (cons (make-rectangle (make-posn 30 20) 5 5 'blue)
              (cons (make-rectangle (make-posn 65 20) 5 5 'blue)
                    (cons (make-rectangle (make-posn 40 75) 20 10 'red)
                          (cons (make-rectangle (make-posn 45 35) 10 30 'blue)
                                empty))))))

;; 10.3.2
(define (draw-losh shapes)
  (cond
    ((empty? shapes) true)
    (else
     (and
      (draw-shape (first shapes))
      (draw-losh (rest shapes))))))

;; 10.3.3
(define (translate-losh delta shapes)
  (cond
    ((empty? shapes) empty)
    (else
     (cons
      (translate-shape delta (first shapes))
      (translate-losh delta (rest shapes))))))
     
;; 10.3.4
(define (clear-losh shapes)
  (cond
    ((empty? shapes) true)
    (else
     (and
      (clear-shape (first shapes))
      (clear-losh (rest shapes))))))

;; 10.3.5
(define (draw-and-clear-picture pic)
  (and
   (draw-losh pic)
   (sleep-for-a-while 1)
   (clear-losh pic)))

;; 10.3.6
(define (move-picture delta pic)
  (cond 
    ((draw-and-clear-picture pic) (translate-losh delta pic))
    (else pic)))
  