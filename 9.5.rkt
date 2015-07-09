;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9.5|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))

;;9.5.2
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ 1 (how-many-symbols (rest a-list-of-symbols)))]))

(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ 1 (how-many-symbols (rest a-list-of-numbers)))]))

;;9.5.3
(define (dollar-store? a-list-of-price)
  (cond
    [(empty? a-list-of-price) true]
    [else (and  (< (first a-list-of-price) 1)
                (dollar-store? (rest a-list-of-price)))]))

(define (dollar-store-limit? a-list-of-price limit-price)
  (cond
    [(empty? a-list-of-price) true]
    [else (and  (< (first a-list-of-price) limit-price)
                (dollar-store-limit? (rest a-list-of-price) limit-price))]))

;;9.5.4
(define (check-range1 a-list-of-temp)
  (cond
    ((empty? a-list-of-temp) true)
    (else (and (and (> (first a-list-of-temp) 5) (< (first a-list-of-temp) 95))
               (check-range1 (rest a-list-of-temp))))))

(define (check-range2 a-list-of-temp begin end)
  (cond
    ((empty? a-list-of-temp) true)
    (else (and (and (> (first a-list-of-temp) begin) (< (first a-list-of-temp) end))
               (check-range2 (rest a-list-of-temp) begin end)))))

;;9.5.7
(define (average-price a-list-of-price)
  (cond
    ((empty? a-list-of-price) (error 'average-price "except a no empty list"))
    (else (/ (sum a-list-of-price) (how-many-numbers a-list-of-price)))))

;;9.5.8
;;draw-circles : a-posn a-list-of-numbers -> boolean
(define (draw-circles a-posn a-list-of-numbers)
  (cond
    ((empty? a-list-of-numbers) true)
    ((cons? a-list-of-numbers) 
     (and (draw-circle a-posn (first a-list-of-numbers) 'red)
          (draw-circles a-posn (rest a-list-of-numbers))))
    (else (error 'asdf))))