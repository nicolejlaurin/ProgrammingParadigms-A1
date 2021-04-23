

(display "COMP3007 - Assignment 1")(newline)
(newline)
(display "Author: Nicole Laurin")(newline)
(newline)
(display "student #: 101043422")(newline)
(newline)
(display "Question 1")(newline)
(newline)
(display "a) 1 + -2 - 3 + 4 + -5 + 6")(newline)
(newline)
(display "(+(+(+(+(+ 1 -2) -3) 4) -5) 6) ")(newline)
(display "Expected output: 1")(newline)
(newline)
(newline)

(display "b) 20-1+((26/2 + 2)*(20/5 - 2)) ")(newline)
(newline)
(display "(+ (- 20 1) (* (+ (/ 26 2) 2) (- (/ 20 5) 2))) ")(newline)
(display "Expected output: 49")(newline)
(newline)
(newline)


(display "c) (63/9*(12/4-14/(13+2))+12)/4 ")(newline)
(newline)
(display "(/(+ (* (/ 63 9) (- (/ 12 4) (/ 14 (+ 13 2)))) 12) 4) ")(newline)
(display "Expected output: 6.61666666667")(newline)
(newline)
(newline)


(display "d) ((50*20)*2)+((17/4)+3.85)+((30*2)-48) ")(newline)
(newline)
(display "(+(+(*(* 50 20) 2) (+ (/ 17 4) 3.85)) (- (* 30 2) 48)) ")(newline)
(display "Expected output: 2020.1")(newline)
(newline)
(newline)




(display "Question 2")(newline)
(newline)


(display "a) Create a procedure (cube x) that computes x^3")(newline)
(newline)

(define (cube x)
  (*(* x  x)x))


(display "b) Create a procedure that computes the following function: f(x) = 3x2 + 4 ")(newline)
(newline)

(define (qtion-b x)
  (+ (* 3 (* x x)) 4))

(newline)
(display " (qtion-b 2)")(newline)
(display " (+ (* 3 (* 2 2)) 4)")(newline)
(display " (+ (* 3 4) 4)")(newline)
(display " (+ 12 4)")(newline)
(display " (16)")(newline)

(display "c) Create a procedure that computes the following function: g(x) = f(2x) - 2x^3")(newline)
(newline)

(define (qtion-c x)
  (- (qtion-b (* 2 x)) (* 2 (cube x))))

;(- (+ (* 3 (* (* 2 x) (* 2 x))) 4) (* 2 (*(* x  x)x)))


(display "d) Create a procedure that computes the following function: h(x) = 2f(x/2) + g(x)")(newline)
(newline)

(define (qtion-d x)
  (+(* 2 (qtion-b (/ x 2))) (qtion-c x)))


  ;(+(* 2 (+ (* 3 (* (/ x 2) (/ x 2))) 4))) (- (+ (* 3 (* (* 2 x) (* 2 x))) 4) (* 2 (*(* x  x)x)))))


(define (app x)
  (qtion-d (* 2 3)))

;[2 marks] Provide the substitution model using applicative order for (h (* 2 3)).

(Display "e) Provide the substitution model using applicative order for (h (* 2 3)).")
(newline)

(qtion-d (* 2 3))
(qtion-d 6)
(+(* 2 (qtion-b (/ 6 2))) (qtion-c 6))
(+(* 2 (qtion-b (/ 6 2))) (- (qtion-b (* 2 6)) (* 2 (cube 6))))
(+(* 2 (qtion-b 3)) (- (qtion-b (* 2 6)) (* 2 (cube 6))))
(+(* 2 (qtion-b 3)) (- (qtion-b 12) (* 2 (cube 6))))
(+(* 2 (qtion-b 3)) (- (qtion-b 12) (* 2 (*(* 6  6)6))))
(+(* 2 (+ (* 3 (* 3 3)) 4)) (- (qtion-b 12) (* 2 (*(* 6  6)6))))
(+(* 2 (+ (* 3 (* 3 3)) 4)) (-   (+ (* 3 (* 12 12)) 4) (* 2 (*(* 6  6)6))))
(+(* 2 (+ (* 3 9) 4)) (-   (+ (* 3 (* 12 12)) 4) (* 2 (*(* 6  6)6))))
(+(* 2 (+ (* 3 9) 4)) (-   (+ (* 3 144) 4) (* 2 (*(* 6  6)6))))
(+(* 2 (+ (* 3 9) 4)) (-   (+ (* 3 144) 4) (* 2 (* 36 6))))
(+(* 2 (+ 27 4)) (- (+ (* 3 144) 4) (* 2 (* 36 6))))
(+(* 2 (+ 27 4)) (- (+ (* 3 144) 4) (* 2 216)))
(+(* 2 31) (- (+ (* 3 144) 4) (* 2 216)))
(+(* 2 31) (- (+ 432 4) (* 2 216)))
(+(* 2 31) (- 436 (* 2 216)))
(+(* 2 31) (- 436 432))
(+(* 2 31) 4 )
(+ 62 4 )
;66



(Display "f) Provide the substitution model using normal order for (h (* 2 3)).")
(newline)

(qtion-d (* 2 3))
(+(* 2 (qtion-b (/ (* 2 3) 2))) (qtion-c (* 2 3)))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (qtion-c (* 2 3)))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (qtion-b (* 2 (* 2 3))) (* 2 (cube (* 2 3)))))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (cube (* 2 3)))))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* (* 2 3) (* 2 3))(* 2 3)))))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 (* 2 3))(* 2 3)))))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 6)(* 2 3)))))
(+(* 2 (+ (* 3 (* (/ (* 2 3) 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 6)6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ (* 2 3) 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 6)6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* (* 2 (* 2 3)) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 6)6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* (* 2 6) (* 2 (* 2 3)))) 4) (* 2 (*(* 6 6)6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* (* 2 6) (* 2 6))) 4) (* 2 (*(* 6 6)6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* (* 2 6) (* 2 6))) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* 12 (* 2 6))) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 (* (/ 6 2)(/ 6 2))) 4)) (- (+ (* 3 (* 12 12)) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 (* 3 (/ 6 2))) 4)) (- (+ (* 3 (* 12 12)) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 (* 3 3)) 4)) (- (+ (* 3 (* 12 12)) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 (* 3 3)) 4)) (- (+ (* 3 144) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 9) 4)) (- (+ (* 3 144) 4) (* 2 (* 36 6))))
(+(* 2 (+ (* 3 9) 4)) (- (+ (* 3 144) 4) (* 2 216)))
(+(* 2 (+ 27 4)) (- (+ (* 3 144) 4) (* 2 216)))
(+(* 2 (+ 27 4)) (- (+ 432 4) (* 2 216)))
(+(* 2 31) (- (+ 432 4) (* 2 216)))
(+(* 2 31) (- 436 (* 2 216)))
(+(* 2 31) (- 436 432))
(+ 62 (- 436 432))
(+ 62 4)
;66



(display "Question 3")
(newline)
(display "a) Create the procedure (quadratic a b c) to calculate the roots of a quadratic formula with coefficient a, b, and c.")

;The procedure should return false (#f) if there are no real roots (this occurs when the discriminant (b2 - 4ac) is negative, or if a is 0).


(define (quadratic a b c)
  (if (or (= a 0) (< (- (* b 2) (* 4 (* a c))) 0))
      #f
      (/ (+ -b (sqrt (- (* b b) (* 4 (* a c))))) (* 2 a))))


(newline)
(display "b) Write a procedure called convert that takes as arguments: an amount (number), and two strings representing the input and output units respectively.")(newline)
(newline)


(define (convert num str1 str2)
  (cond ((and (equal? str1 "B") (equal? str2 "KB")) (/ num 1000))
        ((and (equal? str1 "B") (equal? str2 "KiB")) (/ num 1024))
        ((and (equal? str1 "B") (equal? str2 "B")) (* num 1))
        ((and (equal? str1 "KB") (equal? str2 "KiB")) (/ num 1.024))
        ((and (equal? str1 "KB") (equal? str2 "B")) (* num 1000))
        ((and (equal? str1 "KB") (equal? str2 "KB")) (* num 1))
        ((and (equal? str1 "KiB") (equal? str2 "KB")) (* num 1.024))
        ((and (equal? str1 "KiB") (equal? str2 "B")) (* num 1024))
        ((and (equal? str1 "KiB") (equal? str2 "KiB")) (* num 1))
        (else (string-append "Could not convert from " str1 " to " str2 ))))
      
(newline)        
(display "test cases")
(newline)

(display "case 1: Convert Bytes to Kilobytes")
(newline)
(display " (convert 42 B KB) ")
(display " (0.042) ")
(newline)

(display "Case 2: Convert Bytes to Kibibytes")
(newline)
(display " (convert 42 B KiB) ")
(display " (0.0410156) ")
(newline)

(display "Case 3: Convert Bytes to Bytes")
(newline)
(display " (convert 42 B B) ")
(display " (42) ")
(newline)

(display "Case 4: Convert Kilobytes to Kibibytes")
(newline)
(display " (convert 42 KB KiB) ")
(display " (41.0156) ")
(newline)

(display "Case 5: Convert Kilobytes to bytes")
(newline)
(display " (convert 42 B KB) ")
(display " (42000) ")
(newline)

(display "Case 6: Convert Kilobytes to Kilobytes")
(newline)
(display " (convert 42 KB KB) ")
(display " (42) ")
(newline)

(display "Case 7: Convert Kibibytes to Kilobytes")
(newline)
(display " (convert 42 KiB KB) ")
(display " (43.008) ")
(newline)

(display "Case 8: Convert Kibibytes to bytes")
(newline)
(display " (convert 42 KiB B) ")
(display " (43008) ")
(newline)

(display "Case 9: Convert Kibibytes to Kibibytes")
(newline)
(display " (convert 42 KiB KiB) ")
(display " (42) ")
(newline)

(display "Case 10: Error ")
(display " (convert r KiB K) ")
(display " (Could not convert from Kib to K) ")
(newline)
(newline)

(display "Question 4")
(newline)
(display " a)")

(define (user-num str)
  (display str)
  (newline)
  (display "Enter a number: ")
  (define answer (read))
  (newline)
  (if (number? answer ) (display answer) (display "0")))

(newline)
(display "Test case 1: ")
(newline)
(display "Enter a number: hi")
(display "0")
(newline)
(display "Test case 2: ")
(newline)
(display "Enter a number: 2")
(display "2")

(newline)
(display "Question 5: The following program can be used to determine if a given interpreter is using applicative-order or normal-order evaluation:")(newline)
(newline)
(newline)
(display "     (define (test x y)")
(newline)
(display "           (if (= x 0)")
(newline)
(display "              x")
(newline)
(display "              y))")
(newline)
(display "     (test 0 (/ 3 0))")
(newline)
(display "a) What will be the behaviour of this code on an interpreter that uses applicative-order evaluation? Explain why.")
(newline)
(display " The behaviour of this code on an interpreter that uses applicative-order evaluation will give an error because by definition of applicative order, ")(newline)
(display " we would need to evaluate the subexpressions before passing them as an argument. Here is we apply this strategy, we would need to solve for the ")(newline)
(display " expression (/ 3 0) first. This results in an error and we cannot pass an error as an argument when calling the function test.")(newline)
(newline)
(newline)
(display "b) What behaviour will be observed with an interpreter that uses normal-order evaluation? Explain why.")   (newline)
(newline)
(display " The behaviour of this code observed with an interpreter that uses normal-order evaluation will result in zero. By applying the normal-order evaluation, ")(newline)
(display " we are evaluating expressions only when their value is needed. Here we call test and pass the arguments 0 as x and (/ 3 0) as y. Since we meet the first")(newline)
(display " condition of the if statement where x = 0, we don't have to evaluate y. ")(newline)
(newline)
(newline)

(display "Question 6: Observe that Scheme's model of evaluation allows for combinations where the operator is itself a combination.")
(display "Use this observation to describe the behaviour of the following procedure: ")
(newline)
(display "	(define (foo a b) ")
(newline)
(display "	    ((cond ((> b 0) +)((= b 0) *)(else /)) a b)) ")
(newline)
(newline)
	
(display "Your answer should describe what happens for all integer values of a and b. Illustrate your answer using the substitution model. ")


(display " To observe the behaviour, we need to look at the 3 test cases")
(newline)
(display " Test case 1:")
(newline)
(display "	(define (foo 2 1) ")
(newline)
(display "	    ((cond ((> 1 0) +)((= 1 0) *)(else /)) 2 1)) ")
(newline)
(display "	    ((cond (#t +)(#f *)(#f /)) 2 1)) ")
(newline)
(display "	    ((+ 2 1)) ")
(newline)
(display "	    (3) ")
(newline)


(newline)
(display " Test case 2:")
(newline)
(display "	(define (foo 2 -1) ")
(newline)
(display "	    ((cond ((> -1 0) +)((= -1 0) *)(else /)) 2 -1)) ")
(newline)
(display "	    ((cond (#f +)(#f *)(#t /)) 2 -1)) ")
(newline)
(display "	    ((/ 2 -1)) ")
(newline)
(display "	    (-2) ")
(newline)


(newline)
(display " Test case 3:")
(newline)
(display "	(define (foo 2 0) ")
(newline)
(display "	    ((cond ((> 0 0) +)((= 0 0) *)(else /)) 2 1)) ")
(newline)
(display "	    ((cond (#f +)(#t *)(#f /)) 2 1)) ")
(newline)
(display "	    ((* 2 1)) ")
(newline)
(display "	    (2) ")
(newline)
(newline)

(display "Based on testing the 3 conditions, we can deduce that the function is dependant on parameter b. Here we are grouping multiple expressions.")(newline)
(display "This grouping is also reffered to as a compound procedure. In this test, we have 3 possible outcomes. Case 1 where a and b are added if b is greater ")(newline)
(display "than 0. Case 2 where a is divided by b if b equals 0. Case 3 represents every other possibility, where a and b are multiplied. the parameter b is ")(newline)
(display "important since its value affects which condition will be taken thus affecting the final result. The value of a will only affect the final result")(newline)





