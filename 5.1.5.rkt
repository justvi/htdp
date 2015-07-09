;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5.1.5) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp")))))
(define xor
  (lambda (a b)
    (cond
      [a (not b)]
      [else b])))

(define (check-color t1 t2 g1 g2)
  (cond
    [(and (symbol=? t1 g1) (symbol=? t2 g2)) 'Perfect]
    [(or (symbol=? t1 g1) (symbol=? t2 g2)) 'OneColorAtCorrectPosition]
    [(xor (symbol=? t1 g1) (symbol=? t2 g2)) 'OneMatched]
    [else 'no]))
                                         