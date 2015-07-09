;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10.2|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct ir (name price))

;; sum : inventory -> number
;; 计算an-inv的价格总和
(define (sum an-inv)
  (cond
    ((empty? an-inv) 0)
    (else
     (+ (ir-price (first an-inv)) (sum (rest an-inv))))))

;; 10.2.1
;; contains-doll? : inventory -> boolean
;; 测试an-inv中是否包含一条‘doll记录
(define (contains-doll? an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir-name (first an-inv)) 'doll) true)
    (else
     (contains-doll? (rest an-inv)))))

;; contains? : inventory asymbol -> boolean
;; 测试an-inv中是否有一条symbol记录
(define (contains? asymbol an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir-name (first an-inv)) asymbol) true)
    (else
     (contains? asymbol (rest an-inv)))))

;; 10.2.2
(define-struct ir2 (name price pic))

;; show-picture : aname inventory -> pic
(define (show-picture aname an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir2-name (first an-inv)) aname) (ir2-pic (first an-inv)))
    (else
     (show-picture aname (rest an-inv)))))

;; 10.2.3
(define (price-of aname an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir2-name (first an-inv)) aname) (ir2-price (first an-inv)))
    (else
     (price-of aname (rest an-inv)))))

;; 10.2.4
;; 电话记录
(define-struct pr (name phone))
;; 通讯录 addr-book
;; empty or (cons a-pr addr-book)

;; whose-number : a-phone addr-book -> symbol
;; 根据电话号码找人名
(define (whose-number a-phone addr-book)
  (cond
    ((empty? addr-book) (error 'whose-number "no such people"))
    ((= (pr-phone (first addr-book)) a-phone) (pr-name (first addr-book)))
    (else
     (whose-number a-phone (rest addr-book)))))

(define (phone-number a-name addr-book)
  (cond
    ((empty? addr-book) (error 'phone-number "no such phone"))
    ((symbol=? (pr-name (first addr-book)) a-name) (pr-phone (first addr-book)))
    (else
     (phone-number a-name (rest addr-book)))))

;; 10.2.5
;; extract>1 : inventory -> inventory
;; 返回库存清单中价格大于1的商品
(define (extract>1 an-inv)
  (cond
    ((empty? an-inv) empty)
    ((> (ir-price (first an-inv)) 1) (cons (first an-inv) (extract>1 (rest an-inv))))
    (else
     (extract>1 (rest an-inv)))))

;; 10.2.7
;; raise-prices : inventorr -> inventory
;; 所有商品涨价50%
(define (raise-prices an-inv)
  (cond
    ((empty? an-inv) empty)
    (else 
     (cons (make-ir (ir-name (first an-inv)) (* 1.5 (ir-price (first an-inv))))
           (raise-prices (rest an-inv))))))

;; 10.2.8
;; recall : symbol an-inv -> an-inv
;; 返回列表中除名称外所有元素
(define (recall ty an-inv)
  (cond
    ((empty? an-inv) empty)
    ((symbol=? (ir-name (first an-inv)) ty) (recall ty (rest an-inv)))
    (else
     (cons (make-ir (ir-name (first an-inv)) (ir-price (first an-inv))) (recall ty (rest an-inv))))))