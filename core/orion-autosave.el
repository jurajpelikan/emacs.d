;; Code

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(defun orion-auto-save-command ()
  "Save the current buffer"
  (when (and buffer-file-name
	     (buffer-modified-p (current-buffer))
	     (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands class &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.
The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
		 `(defadvice ,command (,class ,(intern (concat (symbol-name command) "-" advice-name)) activate)
		    ,@body))
	       commands)))

;; advise all window switching functions
(advise-commands
 "auto-save"
 (switch-to-buffer other-window windmove-up windmove-down windmove-left windmove-right)
 before
 (orion-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'orion-auto-save-command)
(add-hook 'before-save-hook 'whitespace-cleanup)


(provide 'orion-autosave)
;;; orion-autosave.el ends here
