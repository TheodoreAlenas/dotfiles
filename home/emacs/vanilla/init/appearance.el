;; normally Emacs opens a floating window
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(set-face-attribute 'default nil :font "Source Code Pro-15")

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(setq show-trailing-whitespace t)
(setq column-number-mode t)

(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; load-theme will be so late that it will override this
(set-frame-parameter nil 'background-color "#101824")
(add-to-list 'default-frame-alist '(background-color . "#101824"))
