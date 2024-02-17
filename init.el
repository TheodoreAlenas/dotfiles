;; saves
(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(set-face-attribute 'default nil :family "Source Code Pro" :height 150)
(set-face-attribute 'fixed-pitch nil :family "Source Code Pro" :height 150)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; buffer look
(setq-default show-trailing-whitespace t)
(setq column-number-mode t)
(setq split-width-threshold 120)
(setq explicit-shell-file-name "/usr/bin/dash")
(load-theme 'ef-night t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(editorconfig-mode)

;; https://www.gnu.org/software/auctex/
;; for better latex support

;; org
(require 'org)
(add-hook 'text-mode-hook #'variable-pitch-mode)
(add-hook 'text-mode-hook (lambda () (setq line-spacing 0.2)))
(setq org-hide-emphasis-markers t)
(set-face-attribute 'org-table       nil :inherit 'fixed-pitch)
(set-face-attribute 'org-agenda-date nil :inherit 'fixed-pitch)
(set-face-attribute 'org-date        nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block       nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code        nil :inherit 'fixed-pitch)

;; eglot
(setq eldoc-echo-area-use-multiline-p nil)
(setq eglot-confirm-server-initiated-edits nil)
(require 'eglot)
(add-to-list
 'eglot-server-programs
 '(prolog-mode
   "sh" "-c"
   "(echo $0; echo $1) > /tmp/to-swipl && swipl /tmp/to-swipl"
   "?- use_module(library(prolog_lsp))."
   "?- run_stdio_language_server."))

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes t)
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml") t)
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "_")
 '(git-gutter:modified-sign "~")
 '(git-gutter:update-interval 0.2)
 '(org-agenda-files '("/home/aleena/code/emacs/test.org"))
 '(package-selected-packages
   '(rainbow-delimiters lua-mode nginx-mode gptel rust-mode graphviz-dot-mode docker-compose-mode systemd web-mode pdf-tools ef-themes ligature haskell-mode slime editorconfig magit git-gutter eglot)))


(put 'narrow-to-region 'disabled nil)
