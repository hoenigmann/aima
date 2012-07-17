(use aima-vacuum)
(use debug)

(define (make-reflex-albert-agent start)
  (make-reflex-agent
   start
   ;; Location is an integer for which the API has a left? and a
   ;; right? and status is a boolean indicating #true is clean #false
   ;; dirty.
   (lambda (location status)
     (debug "This is mine")
     (if (not status)
         'suck
         (if (left? location)
             'right
             'left)))))
;;(simulate-vacuum (make-world clean dirty) (make-reflex-albert-agent left) 10)

(define (make-stateful-agent start)
  (let  ((board (make-world )))
    (lambda (location status)
      (if status
          (begin
            (vector-set! board location clean)
            (if (all-clean? board)
                'noop
                (if (right? location)
                    'left
                    'right)))
          'suck))))

(simulate-vacuum (make-world clean dirty) (make-stateful-agent left) 10)
