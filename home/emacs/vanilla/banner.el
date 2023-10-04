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
