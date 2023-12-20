(vertico-mode)
(marginalia-mode)
;;(vertico-grid-mode)

; got to hook it better
(editorconfig-mode)

(setq eglot-confirm-server-initiated-edits nil)

(require 'git-gutter)
(global-git-gutter-mode 1)

(set-face-foreground 'git-gutter:modified "steel blue")
(set-face-foreground 'git-gutter:added "medium sea green")
(set-face-foreground 'git-gutter:deleted "brown2")

;; (eval-after-load *tetris* (define-key tetris-mode-map (kbd "<up>") 'tetris-rotate-next))

(defun al/prepare-for-ligatures ()
  "For Haskell (ligatures are from a package)"
  (set-face-attribute 'default nil :font "Hasklug Nerd Font"))

(use-package haskell-mode :config
  (add-to-list 'haskell-mode-hook 'al/prepare-for-ligatures)
  (add-to-list 'haskell-mode-hook 'ligature-mode))

(setq al/haskell-ligature-strings
      '("<*" "<*>" "<+>" "<$>" "***" "<|" "|>" "<|>" "!!" "||" "==="
        "==>" "<<<" ">>>" "<>" "+++" "<-" "->" "=>" ">>" "<<" ">>="
        "=<<" ".." "..." "::" "-<" ">-" "-<<" ">>-" "++" "/=" "=="))

(use-package ligature :config
  (ligature-set-ligatures '(haskell-mode) al/haskell-ligature-strings))
