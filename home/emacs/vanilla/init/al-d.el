(defun al-d ()
  "Wrap the file in a C-style ifndef, after a prompt."
  (interactive)
  
  (setq-local c (current-word))
  (beginning-of-line)
  (kill-line)
  
  (beginning-of-buffer)
  (insert "#ifndef " c "\n")
  (insert "#define " c "\n")
  
  (end-of-buffer)
  (insert "\n\n\n#endif")
  
  (previous-line 2))

(global-set-key (kbd "C-c C-? C-C") 'al-d)
