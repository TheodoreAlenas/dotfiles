;;(keyboard-translate C-x C-t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;(global-set-key (kbd "C-t") 'previous-buffer)
;;(global-set-key (kbd "M-t") 'next-buffer)

(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
