(in-package :cl-study)


(gamekit:register-resource-package
 :keyword
 "c:/Users/mail/Downloads/")

(define-image :pony "pony2.png")

(define-image :brain "brain64.png")

(defun current-time ()
  (bodge-util:real-time-seconds))

(defparameter *y* 0)

(defparameter *t0* 0)
(defparameter *speed* 6)
(defparameter *td* (/ 3.14159265 *speed*))

(defparameter *delta-brain* 3)

(defun calc-pony-position ()
  (let* ((amplitude 200)
         (offset (sin (* (- (current-time) *t0*) *speed*))))
    (abs (* offset amplitude))))


(defun where-is-pony ()
  (if (< (- (current-time) *t0*) *td*)
      (setf *y* (calc-pony-position))
      (setf *y* 0)))


(bind-button :space :pressed
             (lambda ()
               (setf *t0* (current-time))))

(defparameter *elena* 0)

(defun draw-brain (x)
  (draw-image (vec2 x 5) :brain))


(defun spam-brain ()
  (let* ((offset 400)
         (brain-x (+ (* (- *elena* (current-time)) 70) offset)))
    (if (< brain-x 0)
        (progn
          (setf brain-x offset)
          (kristina)))
    (draw-brain brain-x)))


(defun kristina ()
  (setf *elena* (current-time)))


(defsketch the-game
  (where-is-pony)

  (draw-image (vec2 0 *y*) :pony)

  (spam-brain))
