;;; Made largely by Chad GPT

(provide 'theme-list)

(defun al/theme-print (&optional buffer)
  "Erase the buffer and print themes."
  (interactive "P")
  (let ((b (if (equal buffer nil) (current-buffer) buffer)))
    (with-current-buffer b
      (setq buffer-read-only nil)
      (erase-buffer)
      (insert "Available Themes:\n\n")
      (dolist (theme (custom-available-themes))
        (insert (propertize (symbol-name theme)
                            'theme-name theme
                            'face 'font-lock-keyword-face))
        (insert "\n")))))

(defun al/theme-list-revert ()
  "Print the theme list again, in this theme list buffer."
  (interactive)
  (let ((last (point)))
    (al/theme-print)
    (goto-char last)
    (message "Themes printed again")))

(defun al/theme-list ()
  "Create a buffer displaying available themes and enable selecting one."
  (interactive)
  (let ((buffer (get-buffer-create "*Theme List*")))
    (al/theme-print buffer)
    (with-current-buffer buffer
      (al/theme-picker-mode)
      (goto-char (point-min))
      (forward-line 2))
    (pop-to-buffer buffer)))

(defun al/theme-apply ()
  "Disable any active themes and load the theme under the cursor."
  (interactive)
  (let* ((theme (get-text-property (point) 'theme-name)))
    (when theme
      (mapc #'disable-theme custom-enabled-themes)
      (load-theme theme t)
      (message "Loaded theme: %s" theme))))

(define-derived-mode al/theme-picker-mode special-mode "Theme Picker"
  "Major mode for selecting a theme from a list of available themes."
  (define-key al/theme-picker-mode-map (kbd "n") #'forward-line)
  (define-key al/theme-picker-mode-map (kbd "p") #'previous-line)
  (define-key al/theme-picker-mode-map (kbd "g") #'al/theme-list-revert)
  (define-key al/theme-picker-mode-map (kbd "RET") #'al/theme-apply)
  (define-key al/theme-picker-mode-map (kbd "q") #'quit-window))
