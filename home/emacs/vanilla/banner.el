;; License at the bottom

(defun my/end-of-paragraph-pos (&rest args)
  "Return position where banner ends."
  (save-excursion
    (while (not (or (eobp) (and (bolp) (eolp))))
      (forward-line))
    (point)))

(defface font-lock-banner-face
  '((t (:bold t :foreground "red")))
  "Font lock bold"
  :group 'font-lock-faces)

(setq font-lock-multiline t)

(font-lock-add-keywords
 nil
 '(("\#+.*\#$"
    (0 'font-lock-banner-face)
    ("#"
     (my/end-of-paragraph-pos)
     nil
     (0 'font-lock-banner-face)))))

; # This is a normal comment
##########################
# While this is a banner #
##########################
; 
; ########
; # hep  #
; ########
; 

;; Copyright (c) 2023 Dimakopoulos Theodoros
;; 
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; 
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;; 
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
