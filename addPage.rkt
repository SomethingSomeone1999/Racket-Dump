#lang racket/gui

(require "fvb.rkt")

;add words page
(define addWordPanel (new panel%
                          [parent mainframe]
                          [style '(deleted)]))

(define backHorizontalPanel (new horizontal-panel%
                                 [parent addWordPanel]
                                 [alignment '(left top)]))

(define backAddWord (new button%
                         [parent backHorizontalPanel]
                         [label "Back"]
                         [callback (lambda (button event)
                                     {send addWordPanel show #f}
                                     {send mainframe delete-child addWordPanel}
                                     {send mainframe add-child mainPanel}
                                     {send mainPanel show #t})]
                         ))