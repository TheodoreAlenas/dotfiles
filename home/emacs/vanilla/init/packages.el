(vertico-mode)
;;(vertico-grid-mode)

(marginalia-mode)

; got to hook it better
(editorconfig-mode)

(setq eglot-confirm-server-initiated-edits nil)

(setq org-hide-emphasis-markers t)

;; (custom-theme-set-faces
;;  'user
;;  `(org-level-4 ((t (:font "Source Code Pro" :height 1.1))))
;;  `(org-level-3 ((t (:font "Source Code Pro" :height 1.25))))
;;  `(org-level-2 ((t (:font "Source Code Pro" :height 1.5))))
;;  `(org-level-1 ((t (:font "Source Code Pro" :height 1.75))))
;;  `(org-document-title ((t (:font "Source Code Pro" :height 2.0 :underline nil)))))
;;
;; autosaves

(require 'git-gutter)
(global-git-gutter-mode 1)

(set-face-foreground 'git-gutter:modified "steel blue")
(set-face-foreground 'git-gutter:added "medium sea green")
(set-face-foreground 'git-gutter:deleted "brown2")

;; (eval-after-load *tetris* (define-key tetris-mode-map (kbd "<up>") 'tetris-rotate-next))
