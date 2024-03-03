;; saves
(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(dolist (def-fixpit '(default fixed-pitch))
  (set-face-attribute def-fixpit nil
		      :family "Source Code Pro"
		      :height 150
		      :weight 'medium))

;; buffer look
(global-whitespace-mode 1)
(setq split-width-threshold 120)
(setq explicit-shell-file-name "/usr/bin/dash")
(column-number-mode t)
(load-theme 'ef-elea-dark t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(editorconfig-mode)

;; https://www.gnu.org/software/auctex/
;; for better latex support

;; org
(require 'org)

(defun al/prose-enable ()
    "Variable pitch mode and line spacing"
  (interactive)
  (variable-pitch-mode 1)
  (setq line-spacing 0.2))

(defun al/prose-disable ()
    "Variable pitch mode and line spacing"
  (interactive)
  (variable-pitch-mode -1)
  (setq line-spacing nil))

(add-hook 'text-mode-hook #'al/prose-enable)
(setq org-hide-emphasis-markers t)
(dolist (org-stuff
         '(org-table org-agenda-date org-date org-block org-code))
  (set-face-attribute org-stuff nil :inherit 'fixed-pitch))

;; eglot
(setq eldoc-echo-area-use-multiline-p nil)
(setq eglot-confirm-server-initiated-edits nil)

;; Haskell ligatures

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

;; Greek
(use-package reverse-im
  :ensure t ; install `reverse-im' using package.el
  :demand t ; always load it
  :custom
  (reverse-im-input-methods '("greek")) ; translate these methods
  :config
  (reverse-im-mode t)) ; turn the mode on

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes t)
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml") t)
 '(org-agenda-files '("/home/aleena/code/emacs/test.org"))
 '(package-selected-packages
   '(go-mode reverse-im evil rainbow-delimiters lua-mode nginx-mode gptel rust-mode graphviz-dot-mode docker-compose-mode systemd web-mode pdf-tools ef-themes ligature haskell-mode slime editorconfig magit git-gutter eglot)))


(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
