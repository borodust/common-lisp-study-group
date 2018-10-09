(in-package :cl-study)

(gamekit:register-resource-package
 :keyword
 "c:/Users/mail/Downloads/")

(define-image :pony "pony2.png")


(defparameter *jump-height* 120)


(defparameter *jump-speed* 3.5)


(defun current-seconds ()
  (bodge-util:epoch-seconds))


(defun calculate-pony-y ()
  (abs (* (sin (* (current-seconds) *jump-speed*))
          *jump-height*)))


(defsketch the-game
  (draw-image (vec2 0 (calculate-pony-y)) :pony))
