;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10.1|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define (wage h)
  (* h 12))

;; hours->wages: list-of-numbers -> list-of-numbers
;; 由周工作时间表alon计算周工资表
(define (hours->wages alon)
  (cond
    ((empty? alon) empty)
    (else 
     (cons (wage2 (first alon)) (hours->wages (rest alon))))))

;; 10.1.1
;; 修改wage中的12为14

;; 10.1.2
(define (wage2 h)
  (cond
   ((< h 100) (* h 12))
   (else (error 'wage2 "too many hours"))))

;; 10.1.4
(define (convert-euro dollar rate)
  (* dollar rate))

(define (convert-euro-1 list-of-dollar rate)
  (cond
    ((empty? list-of-dollar) empty)
    (else
     (cons (convert-euro (first list-of-dollar) rate)
           (convert-euro-1 (rest list-of-dollar) rate)))))

;; 10.1.5
(define (eliminate-exp ua lotp)
  (cond
    ((empty? lotp) empty)
    ((> (first lotp) ua) (eliminate-exp ua (rest lotp)))
    (else
     (cons (first lotp) (eliminate-exp ua (rest lotp))))))

;; 10.1.6
(define (name-robot list-of-robot)
  (cond
    ((empty? list-of-robot) empty)
    ((symbol=? (first list-of-robot) 'robot) (cons 'r2d2 (name-robot (rest list-of-robot))))
    (else
      (cons (first list-of-robot) (name-robot (rest list-of-robot))))))

(define (substitute new old list-of-symbols)
  (cond
    ((empty? list-of-symbols) empty)
    ((symbol=? (first list-of-symbols) old)
     (cons new (substitute new old (rest list-of-symbols))))
    (else
     (cons (first list-of-symbols) (substitute new old (rest list-of-symbols))))))

;; 10.1.7
(define (recall ty lon)
  (cond
    ((empty? lon) empty)
    ((symbol=? ty (first lon)) (recall ty (rest lon)))
    (else
     (cons (first lon) (recall ty (rest lon))))))

;; 10.1.8
(define (funcc a b c add-or-sub)
  (cond
    ((symbol=? add-or-sub 'add)
     (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))
    ((symbol=? add-or-sub 'sub)
     (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))))

(define (quadratic-roots a b c)
  (cond
    ((= a 0) 'degenerate)
    (else
     (cond
       ((< (* b b) (* 4 a c)) 'none)
       ((= (* b b) (* 4 a c)) (cons (- (/ b (* 2 a))) (cons (- (/ b (* 2 a))) empty)))
       (else
        (cons (funcc a b c 'add) (cons (funcc a b c 'sub) empty)))))))

;; 10.1.9
(define (controller-cent n)
  (cons (remainder n 100)
        (cond
          ((> (remainder n 100) 1) (cons 'cents empty))
          (else (cons 'cent empty)))))

(define (controller n)
  (cons (quotient n 100) 
        (cond
          ((<= (quotient n 100) 1) (cons 'dollar (cons 'and (controller-cent n))))
          (else (cons 'dollars (cons 'and (controller-cent n)))))))
  
     