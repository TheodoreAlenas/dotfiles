;;(keyboard-translate C-x C-t)
;;(defun al/compile-in-exercise1 ()
;;  (interactive)
;;  (let ((default-directory "/home/aleena/5/Exercise1/"))
;;    (compile "rm data.db ; make hp && build/hp_main")))
;;(global-set-key (kbd "C-x p c") 'al/compile-in-exercise1)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;(global-set-key (kbd "C-t") 'previous-buffer)
;;(global-set-key (kbd "M-t") 'next-buffer)

(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
