(in-package :cl-study)

(defparameter *color* (vec4 0 0 0 1))

(defun draw-our-rect (x y)
  (draw-rect (vec2 x y)
             100 100
             :fill-paint *color*))

(bind-button :a :pressed
             (lambda ()
               (setf *color* (vec4 0.75 0.25 0.25 1))))

(bind-button :a :released
             (lambda ()
               (setf *color* (vec4 0.25 0.25 0.75 1))))

(defsketch second-rect
  (draw-our-rect 100 100))


(defsketch first-rect
  (draw-our-rect 250 200))
