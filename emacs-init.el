(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path
             (expand-file-name "my-pkg" user-emacs-directory))
(require 'theme-list)

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-splash-screen t)
(setq blink-cursor-blinks 1)
(setq blink-cursor-delay 0.2)
(setq blink-cursor-interval 0.15)
(setq-default cursor-type 'bar)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(dolist (def-fixpit '(default fixed-pitch))
  (set-face-attribute def-fixpit nil
                      :family "Monospace"
                      :height 150
                      :weight 'normal))
(set-face-attribute 'variable-pitch nil
                    :family "Sans Serif"
                    :height 160
                    :weight 'normal)

;; buffer look
(setq split-width-threshold 120)
(column-number-mode t)
(load-theme 'mindre 1)

;; indentation
(setq-default c-basic-offset 4)
(add-hook 'prog-mode-hook (lambda () (indent-tabs-mode -1)))
(add-hook 'org-mode-hook (lambda () (indent-tabs-mode -1)))
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; other functionality
(setq make-backup-files nil)
(setq explicit-shell-file-name "/usr/bin/dash")

;; https://www.gnu.org/software/auctex/
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-engine 'luatex)
;;(setq-default TeX-master nil)

;; Greek
(use-package reverse-im
  :ensure t ; install `reverse-im' using package.el
  :demand t ; always load it
  :custom
  (reverse-im-input-methods '("greek")) ; translate these methods
  :config
  (reverse-im-mode t)) ; turn the mode on

;; error messages
(require 'compile)
(setq-default compile-command "")
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

;; dired
(setq dired-guess-shell-alist-user '(("\\.pdf" "firefox") ("\\.py" "python")))

;; latex
(with-eval-after-load 'latex
  (define-key LaTeX-mode-map (kbd ";") "\\"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes t)
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml") t)
 '(org-appear-autoentities t)
 '(org-appear-autokeywords t)
 '(org-appear-autolinks t)
 '(org-appear-autosubmarkers t)
 '(org-preview-latex-process-alist
   '((dvipng :programs ("lualatex" "dvipng") :description "dvi > png"
             :message
             "you need to install the programs: latex and dvipng."
             :image-input-type "dvi" :image-output-type "png"
             :image-size-adjust (1.0 . 1.0) :latex-compiler
             ("lualatex \\\\nonstopmode\\\\input %f \\\\output %o")
             :image-converter ("dvipng -D %D -T tight -o %O %f")
             :transparent-image-converter
             ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
     (dvisvgm :programs ("latex" "dvisvgm") :description "dvi > svg"
              :message
              "you need to install the programs: latex and dvisvgm."
              :image-input-type "dvi" :image-output-type "svg"
              :image-size-adjust (1.7 . 1.5) :latex-compiler
              ("latex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
     (imagemagick :programs ("latex" "convert") :description
                  "pdf > png" :message
                  "you need to install the programs: latex and imagemagick."
                  :image-input-type "pdf" :image-output-type "png"
                  :image-size-adjust (1.0 . 1.0) :latex-compiler
                  ("pdflatex -interaction nonstopmode -output-directory %o %f")
                  :image-converter
                  ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(package-selected-packages
   '(aircon-theme auctex centered-window cmake-mode docker-compose-mode
                  dockerfile-mode editorconfig eglot evil
                  evil-collection git-gutter go-mode gptel
                  graphviz-dot-mode gruber-darker-theme haskell-mode
                  kotlin-mode ligature lua-mode magit markdown-mode
                  mindre-theme nginx-mode org-appear parchment-theme
                  pdf-tools rainbow-delimiters reverse-im rust-mode
                  slime systemd web-mode zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#F5F5F5")))))
