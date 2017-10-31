;;; Code:

(use-package telephone-line
  :ensure t

  :init
  (defun recreate-message-buffer ()
    (cl-flet ((buffer-string* (buffer)
		(with-current-buffer buffer
		  (buffer-string))))
      (let ((msg (buffer-string* "*Messages*")))
	(kill-buffer "*Messages*")
	(message msg))))

  (add-hook 'after-init-hook #'recreate-message-buffer)

  :config
  (require 'telephone-line-utils)

  (defface light-active
    '((t (:foreground "white" :background "grey22" :inherit mode-line)))
    "Light face active for mode-line."
    :group 'telephone-line)

  (defface light-inactive
    '((t (:foreground "white" :background "grey11" :inherit mode-line-inactive)))
    "Light inactive face for inactive mode-line."
    :group 'telephone-line)

  (defface dark-active
    '((t (:foreground "white" :background "grey22" :inherit mode-line)))
    "Dark face active for mode-line."
    :group 'telephone-line)

  (defface dark-inactive
    '((t (:foreground "white" :background "grey11" :inherit mode-line-inactive)))
    "Dark inactive face for inactive mode-line."
    :group 'telephone-line)

  (telephone-line-defsegment* orion-buffer-segment ()
    "%10b")

  (telephone-line-defsegment* orion-position-segment ()
    "%3l:%3c")


  (setq telephone-line-faces-1 '((light. (light-active . light-inactive))
			       (dark. (dark-active . dark-inactive)))
   telephone-line-primary-left-separator 'telephone-line-cubed-left
	telephone-line-primary-right-separator 'telephone-line-cubed-right
	telephone-line-height 28
	telephone-line-lhs '(

			     (nil . (orion-buffer-segment)))
	telephone-line-center-lhs '()
	telephone-line-center-rhs '()
	telephone-line-rhs '((accent . (orion-position-segment))))
  (telephone-line-mode 1)

  )



(provide 'orion-modeline)
;;; orion-modeline.el ends here
