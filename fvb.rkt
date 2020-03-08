#lang racket/gui

(require "addPage.rkt")

#| Make sure to implement a back button on other pages
Add db function (make sure to practice)
Add new pages
I may want to add an extra frame to the bottom just for cosmetic purposes later
Learn how to trace|#

; The starting page
(define mainframe (new frame%
                       [label "Foreign Vocabulary Builder"]))
(send mainframe show #t)

(define mainPanel (new panel%
                       [parent mainframe]))

(define mainVertical (new vertical-panel%
                          [parent mainPanel]))

(define addWord (new button%
                     [parent mainVertical]
                     [label "Add a New Word"]
                     [stretchable-height #t]
                     [stretchable-width #t]
                     [callback (lambda (button event)
                                 {send mainframe add-child addWordPanel}
                                 {send mainPanel show #f}
                                 {send mainframe delete-child mainPanel}
                                 {send addWordPanel show #t})]))

(define deleteWord (new button%
                        [parent mainVertical]
                        [label "Delete a Word"]
                        [stretchable-height #t]
                        [stretchable-width #t]
                        [callback (lambda (button event)
                                 {send mainframe add-child deleteWordPanel}
                                 {send mainPanel show #f}
                                 {send mainframe delete-child mainPanel}
                                 {send deleteWordPanel show #t})]))

(define searchWord (new button%
                        [parent mainVertical]
                        [label "Search for Words"]
                        [stretchable-height #t]
                        [stretchable-width #t]
                        [callback (lambda (button event)
                                 {send mainframe add-child searchWordPanel}
                                 {send mainPanel show #f}
                                 {send mainframe delete-child mainPanel}
                                 {send searchWordPanel show #t})]))

(define showAll (new button%
                     [parent mainVertical]
                     [label "Show all Words"]
                     [stretchable-height #t]
                     [stretchable-width #t]))


;delete words page
(define deleteWordPanel (new panel%
                          [parent mainframe]
                          [style '(deleted)]))

(define backHorizontalPanelDelete (new horizontal-panel%
                                 [parent deleteWordPanel]
                                 [alignment '(left top)]))

(define backDeleteWord (new button%
                         [parent backHorizontalPanelDelete]
                         [label "Back"]
                         [callback (lambda (button event)
                                     {send deleteWordPanel show #f}
                                     {send mainframe delete-child deleteWordPanel}
                                     {send mainframe add-child mainPanel}
                                     {send mainPanel show #t})]
                         ))

;search words page
(define searchWordPanel (new panel%
                          [parent mainframe]
                          [style '(deleted)]))

(define searchHorizontalPanelDelete (new horizontal-panel%
                                 [parent searchWordPanel]
                                 [alignment '(left top)]))

(define searchDeleteWord (new button%
                         [parent searchHorizontalPanelDelete]
                         [label "Back"]
                         [callback (lambda (button event)
                                     {send searchWordPanel show #f}
                                     {send mainframe delete-child searchWordPanel}
                                     {send mainframe add-child mainPanel}
                                     {send mainPanel show #t})]
                         ))