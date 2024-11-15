(provide 'distort-font)

(defun al/distort-add-hooks ()
  "Initializes the distort package."
  (interactive)
  (dolist (x al/distort-variable-hooks)
    (add-hook x #'al/distort-variable-enable))
  (dolist (x al/distort-big-func-hooks)
    (add-hook x #'al/distort-big-func-enable)))

(defun al/distort-variable-enable ()
  "Enables variable-pitch-mode and adjusts the buffer."
  (interactive)
  (variable-pitch-mode 1)
  (setq-local line-spacing 0.1))

(defun al/distort-variable-disable ()
  "Disables variable-pitch-mode and adjusts the buffer."
  (interactive)
  (variable-pitch-mode 0)
  (setq line-spacing (default-value 'line-spacing)))

(defun al/distort-big-func-enable ()
  "Makes the font bigger for function names in their definition."
  (interactive)
  (face-remap-add-relative 'font-lock-function-name-face :height 1.4))

(defun al/distort-big-func-disable ()
  "See the enable version."
  (interactive)
  (face-remap-reset-base 'font-lock-function-name-face))

(defvar
  al/distortion-hooks
  '(js-mode-hook
    python-mode-hook
    emacs-lisp-mode-hook)
  "Mode hooks for
al/variable-pitch-enable and
al/distort-big-func-enable")

(defvar
  al/distort-variable-hooks
  (append
   '(text-mode-hook
     magit-log-mode-hook)
   (default-value 'al/distortion-hooks))
  "Mode hooks for al/distort-variable-enable")

(defvar
  al/distort-big-func-hooks
  (append
   '()
   (default-value 'al/distortion-hooks))
  "Mode hooks for al/function-names-enable")
