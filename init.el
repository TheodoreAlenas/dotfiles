(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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
(setq split-width-threshold 120)
(column-number-mode t)
(load-theme 'ef-maris-light t)

;; indentation
(setq-default c-basic-offset 4)
(add-hook 'prog-mode-hook (lambda () (indent-tabs-mode -1)))
(add-hook 'org-mode-hook (lambda () (indent-tabs-mode -1)))

;; other functionality
(setq make-backup-files nil)
(setq explicit-shell-file-name "/usr/bin/dash")
;;(setq evil-want-keybinding nil)
;;(evil-collection-init)
;;(evil-mode)

;; https://www.gnu.org/software/auctex/
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-engine 'luatex)
(setq-default TeX-master nil)

;; org
(add-hook 'text-mode-hook #'variable-pitch-mode)
(require 'org)
(setq org-hide-emphasis-markers t)
(setq al/org-faces-fixed-pitch
      '(org-table org-agenda-date org-date org-block org-code))
(setq al/org-faces-big
      '(org-document-title org-level-1 org-level-2))
(defun al/after-load-theme ()
  (interactive)
  (dolist (org-stuff al/org-faces-fixed-pitch)
    (set-face-attribute org-stuff nil :inherit 'fixed-pitch))
  (dolist (org-stuff al/org-faces-big)
    (set-face-attribute org-stuff nil :height 250)))
(al/after-load-theme)

(add-to-list 'org-agenda-files "/home/aleena/2p/my-org/2024-05-20.org")
(add-to-list 'org-agenda-files "/home/aleena/2p/my-org/2024-10-22.org")
(setq org-default-notes-file "/home/aleena/2p/my-org/2024-10-22.org")

;; eglot
(setq eldoc-echo-area-use-multiline-p nil)
(setq eglot-confirm-server-initiated-edits nil)
;;(require 'eglot)
;;(add-to-list
;; 'eglot-server-programs
;; '((tsx-ts-mode typescript-ts-mode)
;;   . ("typescript-language-server" "--stdio")))

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

;; error messages
(add-to-list
 'compilation-error-regexp-alist-alist
 '(al-file
   "file://\\([^:]*\\):\\([0-9]*\\):\\([^)]*\\)"
   1 2 3))
(add-to-list
 'compilation-error-regexp-alist-alist
 '(al-imported-from
   "imported from \\(.*\\)"
   1))
(add-to-list
 'compilation-error-regexp-alist-alist
 '(al-line-of
   "line \\([0-9]*\\) of \\(.*\\)"
   2 1))
(add-to-list 'compilation-error-regexp-alist 'al-file)
(add-to-list 'compilation-error-regexp-alist 'al-imported-from)
(add-to-list 'compilation-error-regexp-alist 'al-line-of)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes t)
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml") t)
 '(package-selected-packages
   '(evil-collection gruber-darker-theme dockerfile-mode markdown-mode kotlin-mode magit auctex go-mode reverse-im evil rainbow-delimiters lua-mode nginx-mode gptel rust-mode graphviz-dot-mode docker-compose-mode systemd web-mode pdf-tools ef-themes ligature haskell-mode slime editorconfig git-gutter eglot)))


(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
