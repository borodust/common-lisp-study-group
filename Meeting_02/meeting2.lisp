(in-package :cl-study)

(defparameter x 100)
(defparameter y 100)

(defsketch second-rect
  (draw-rect (vec2 x y) 100 100 :fill-paint (vec4 (/ x 1000) 0 (/ y 1000) 1)))
