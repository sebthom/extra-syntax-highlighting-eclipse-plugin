;;;; common-lisp-syntax-showcase.lisp
;;;; A syntax-highlighting fixture for ANSI Common Lisp.
;;; Three-semicolon section comment
;; Ordinary comment
; Inline-style comment

#| A block comment, including a nested block:
   #| nested comment |#
   Nothing here is evaluated.
|#

(defpackage #:syntax-showcase
  (:use #:cl)
  (:export #:run-demo #:factorial #:person))
(in-package #:syntax-showcase)

;;; Symbols, constants, numbers, strings, and reader syntax
(defconstant +answer+ 42 "A documented constant.")
(defparameter *greeting* "Hello, Lisp!\nEscaped quote: \" and slash: \\.")
(defvar *counter* 0 "A special (dynamically scoped) variable.")

(defparameter *literal-values*
  (list nil t :keyword 'ordinary-symbol #:uninterned-symbol
        0 -17 +23 3/4 -5/8 1.25 -2.5e3 1.0d-6
        #b101010 #o52 #x2A #16r2a
        #c(3 4) #\A #\Space #\Newline
        "Unicode: λ → ∞"
        '(a b . c) ; dotted list
        #(1 2 :three)
        #2A((1 2) (3 4))
        #*101001))

;; Quote, quasiquote, unquote, unquote-splicing, function quotation.
(defparameter *quoted* '(alpha (beta . gamma) :delta))
(defparameter *template*
  (let ((name 'world) (items '(1 2 3)))
    `(hello ,name ,@items ,(+ 20 22))))
(defparameter *successor* #'1+)

;; Feature expressions: one of these forms is read depending on implementation.
#+sbcl (defparameter *implementation* :sbcl)
#-sbcl (defparameter *implementation* :other)

;; Conditional-reader exclusion (portable Common Lisp).
#+nil (error "Intentionally excluded")

;;; Functions, optional/key/rest parameters, type declarations, and values
(defun factorial (n &optional (acc 1))
  "Compute N! with a tail-recursive local accumulator."
  (declare (type (integer 0 *) n) (type integer acc)
           (optimize (speed 2) (safety 2)))
  (if (zerop n)
      acc
      (factorial (1- n) (* n acc))))

(defun describe-arguments (required &optional (optional :default supplied-p)
                            &rest extras &key (count 1) verbose
                            &allow-other-keys)
  (declare (ignorable optional supplied-p extras))
  (when verbose
    (format t "~&required=~S count=~D~%" required count))
  (values required count supplied-p))

(defun clamp-number (x &key (low 0) (high 100))
  (check-type x real)
  (max low (min x high)))

(defun arithmetic-demo (x y)
  (let* ((sum (+ x y))
         (ratio (if (zerop y) nil (/ x y))))
    (multiple-value-bind (quotient remainder)
        (if (zerop y) (values nil nil) (floor x y))
      (values sum ratio quotient remainder))))

;;; Lexical binding, closures, generalized assignment, and arrays
(defun make-counter (&optional (initial 0))
  (let ((value initial))
    (lambda (&optional (delta 1)) (incf value delta))))

(defun collection-demo ()
  (let* ((numbers (list 1 2 3 4 5))
         (vector (vector 10 20 30))
         (table (make-hash-table :test #'equal))
         (pair (cons :left :right)))
    (setf (gethash "name" table) "Ada"
          (aref vector 1) 99
          (car pair) :updated)
    (push 0 numbers)
    (pop numbers)
    (list (mapcar (lambda (n) (* n n)) numbers)
          (remove-if-not #'evenp numbers)
          (reduce #'+ numbers :initial-value 0)
          (gethash "name" table)
          (coerce vector 'list)
          pair)))

;;; Local functions, destructuring, and control flow
(defun decision-demo (input)
  (labels ((positive-p (x) (and (numberp x) (plusp x))))
    (flet ((tag (x) (list :result x)))
      (tag
       (cond ((null input) :empty)
             ((positive-p input) :positive)
             ((numberp input) :nonpositive)
             ((stringp input) :text)
             (t :other))))))

(defun binding-demo (pairs)
  (loop for (key . value) in pairs
        when (and key value)
          collect (cons key value)))

(defun loop-demo (limit)
  (let ((sum 0))
    (dotimes (i limit sum)
      (unless (oddp i) (incf sum i)))
    (dolist (item '(a b c))
      (case item
        ((a b) (incf sum))
        (otherwise (return))))
    (loop for i from 1 to limit
          for squared = (* i i)
          when (evenp i) collect squared into evens
          finally (return (values sum evens)))))

;;; Macros, backquote, symbol generation, and compile-time processing
(defmacro with-gensym ((var &optional (prefix "TMP")) &body body)
  `(let ((,var (gensym ,prefix))) ,@body))

(defmacro when-let ((var expression) &body body)
  "Evaluate EXPRESSION once; execute BODY if its value is non-NIL."
  `(let ((,var ,expression))
     (when ,var ,@body)))

(defmacro once-only-example (expression)
  (with-gensym (temp)
    `(let ((,temp ,expression))
       (list ,temp ,temp))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun helper-at-compile-time (x) (1+ x)))

;;; Structures and Common Lisp Object System (CLOS)
(defstruct (point (:constructor make-point (x y)))
  (x 0 :type real)
  (y 0 :type real))

(defclass person ()
  ((name :initarg :name :accessor person-name :type string)
   (age :initarg :age :accessor person-age :initform 0))
  (:documentation "A small sample CLOS class."))

(defgeneric greet (object &key punctuation)
  (:documentation "Demonstrate generic functions and keyword arguments."))

(defmethod greet ((object person) &key (punctuation "!"))
  (format nil "Hello, ~A~A" (person-name object) punctuation))

(defmethod greet ((object string) &key (punctuation "."))
  (concatenate 'string object punctuation))

(defmethod (setf person-age) :before (new-age (object person))
  (declare (ignore object))
  (check-type new-age (integer 0 *)))

;;; Conditions, handlers, restarts, and nonlocal exits
(define-condition invalid-input (error)
  ((value :initarg :value :reader invalid-input-value))
  (:report (lambda (condition stream)
             (format stream "Invalid input: ~S"
                     (invalid-input-value condition)))))

(defun safe-reciprocal (x)
  (restart-case
      (progn
        (when (zerop x) (error 'invalid-input :value x))
        (/ 1 x))
    (use-value (replacement)
      :report "Provide a replacement result."
      replacement)))

(defun reciprocal-or-zero (x)
  (handler-case (safe-reciprocal x)
    (invalid-input (condition)
      (declare (ignore condition))
      0)))

(defun early-exit-demo (sequence)
  (block found
    (map nil (lambda (x)
               (when (minusp x) (return-from found x)))
         sequence)
    :not-found))

(defun cleanup-demo ()
  (let ((stream (make-string-output-stream)))
    (unwind-protect
         (format stream "~A ~D ~{~S~^, ~}~%" "Result" +answer+ '(a b c))
      (close stream))))

;;; Dynamic binding, multiple values, and type dispatch
(defun dynamic-demo ()
  (let ((*counter* 10))
    (declare (special *counter*))
    (incf *counter*)
    (typecase *counter*
      (integer :integer)
      (real :real)
      (otherwise :unknown))))

(defun sum-pairs (pairs)
  (loop for (a . b) in pairs
        summing (+ a b)))

;;; Pathnames, formatting directives, and a runnable entry point
(defun run-demo ()
  (let* ((alice (make-instance 'person :name "Ada" :age 37))
         (p (make-point 3 4))
         (path #P"examples/demo.lisp"))
    (format t "~&~A~%" (greet alice))
    (format t "factorial(5) = ~D, point = (~D, ~D)~%"
            (factorial 5) (point-x p) (point-y p))
    (format t "path: ~A; values: ~S~%" path *template*)
    (list :arithmetic (multiple-value-list (arithmetic-demo 13 5))
          :collection (collection-demo)
          :loop (multiple-value-list (loop-demo 5))
          :reciprocal (reciprocal-or-zero 0)
          :dynamic (dynamic-demo))))

;; To run after loading: (syntax-showcase:run-demo)
