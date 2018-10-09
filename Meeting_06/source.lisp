(in-package :cl-study)


(gamekit:register-resource-package
 :keyword
 "c:/Users/mail/Downloads/")

(define-image :pony "pony2.png")

(defun current-time ()
  (bodge-util:real-time-seconds))

(defparameter *y* 0)
(defparameter *is-jumping* nil)

(defparameter *t0* 0)
(defparameter *td* 3.14159265)

(defun where-is-pony ()
  (if (< (- (current-time) *t0*) *td*)
      (setf *is-jumping* t)
      (setf *is-jumping* nil))

  (if (equal *is-jumping* nil)
      (setf *y* 0)
      (setf *y* (abs (*
                      (sin (- (current-time)
                                *t0*))
                      200)))))


(bind-button :space :released
             (lambda ()
               (setf *is-jumping* nil)))


(bind-button :space :pressed
             (lambda ()
               (setf *t0* (current-time))
               (setf *is-jumping* t)))


(defsketch the-game
  (where-is-pony)
  (draw-image (vec2 0 *y*) :pony))
