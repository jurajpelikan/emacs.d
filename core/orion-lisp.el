;;; Code:


(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/local/bin/clisp"
	slime-contribs '(slime-fancy)))


(provide 'orion-lisp)
;;; orion-python.el ends here
