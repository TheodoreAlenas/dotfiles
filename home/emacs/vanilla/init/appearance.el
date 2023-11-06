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
(setq-default show-trailing-whitespace t)
(setq column-number-mode t)
(load-theme 'ef-night t)

(set-frame-parameter nil 'alpha-background 99)
(add-to-list 'default-frame-alist '(alpha-background . 99))
