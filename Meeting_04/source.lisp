(in-package :cl-study)

(defparameter *color* (vec4 0 0 0 1))

(gamekit:register-resource-package :keyword "~/devel/repo/common-lisp-study-group/Meeting_04/")
(define-image :slime "tile_mobs_mob_1.png")

(defun draw-our-rect (x y)
  (draw-rect (vec2 x y)
             100 100
             :thickness 10
             :rounding 10
             :stroke-paint *color*))


(defun draw-our-circle (x y &key color radius)
  (draw-circle (vec2 x y)
               (if radius
                   radius
                   50)
               :fill-paint color))


(defsketch second-rect
  (draw-image (vec2 100 (+ (* (sin (* (bodge-util:epoch-seconds) 3)) 100) 50))
              :slime)
  (draw-our-rect 100 100)
  (draw-our-circle 250 100 :color (vec4 0.5 1 1 1)))
