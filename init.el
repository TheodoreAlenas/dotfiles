;; tab characters
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(editorconfig-mode)

;; saves
(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(set-face-attribute 'default nil :family "Source Code Pro" :height 150)
(set-face-attribute 'fixed-pitch nil :family "Source Code Pro" :height 150)
(set-frame-parameter nil 'alpha-background 99)
(add-to-list 'default-frame-alist '(alpha-background . 99))

;; buffer look
(setq-default show-trailing-whitespace t)
(setq column-number-mode t)
(setq explicit-shell-file-name "/usr/bin/dash")
(eshell-syntax-highlighting-global-mode)
(load-theme 'ef-tritanopia-dark t)
(vertico-mode)
(marginalia-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(require 'git-gutter)
(global-git-gutter-mode 1)

;; for dired painted things, you may want to append to
;; dired-font-lock-keywords
;; https://www.emacswiki.org/emacs/dired%2B.el

;; org
(require 'org)
(add-hook 'text-mode-hook #'variable-pitch-mode)
;;(setq org-src-block-faces 'fixed-pitch)
(set-face-attribute 'org-table       nil :inherit 'fixed-pitch)
(set-face-attribute 'org-agenda-date nil :inherit 'fixed-pitch)
(set-face-attribute 'org-date        nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block       nil :inherit 'fixed-pitch)
(setq org-hide-emphasis-markers t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-code ((t (:family "Monospace")))))

;; eglot
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
   '(eshell-syntax-highlighting rainbow-delimiters lua-mode nginx-mode gptel rust-mode graphviz-dot-mode docker-compose-mode systemd org-babel-eval-in-repl web-mode pdf-tools ef-themes ligature haskell-mode evil marginalia slime editorconfig magit vertico material-theme git-gutter eglot)))


(put 'narrow-to-region 'disabled nil)
