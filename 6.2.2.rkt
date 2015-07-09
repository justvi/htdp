;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6.2.2) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; 红绿灯的大小
(define WIDTH 50) 
(define HEIGHT 160) 
(define BULB-RADIUS 20) 
(define BULB-DISTANCE 10)
;; 灯泡的位置
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS))) 
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))
;; 绘制红灯亮时的灯光
(start WIDTH HEIGHT)
(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red) 
(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)
;; 画红黄绿圆盘
;; draw-bulb : string -> boolean
;; 打开灯
(define (draw-bulb color)
  (cond
    [(symbol=? color 'red) (draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)]
    [(symbol=? color 'yellow) (draw-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)]
    [(symbol=? color 'green) (draw-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)]))

(define (close-bulb color)
  (cond
    [(symbol=? color 'red) (clear-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)]
    [(symbol=? color 'yellow) (clear-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)]
    [(symbol=? color 'green) (clear-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)]))

(define (show-circle color)
  (cond
    [(symbol=? color 'red) (draw-circle (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)]
    [(symbol=? color 'yellow) (draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)]
    [(symbol=? color 'green) (draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)]))
;; 

;; clear-bulb : string -> boolean
;; 输入颜色，关掉相应颜色的灯并返回true
(define (clear-bulb color)
  (cond
    [(symbol=? color 'red)
     (and
      (close-bulb 'red)
      (show-circle 'red))]
    [(symbol=? color 'yellow)
     (and
      (close-bulb 'yellow)
      (show-circle 'yellow))]
    [(symbol=? color 'green)
     (and
      (close-bulb 'green)
      (show-circle 'green))]))
      
(define (switch color1 color2)
  (and
   (clear-bulb color1) (draw-bulb color2)))

(define (next current-color)
      (cond
        [(and (symbol=? current-color 'red) (switch 'red 'green))
         'green]
        [(and (symbol=? current-color 'yellow) (switch 'yellow 'red))
         'red]
        [(and (symbol=? current-color 'green) (switch 'green 'yellow))
'yellow]))