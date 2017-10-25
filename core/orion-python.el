;;; Code:

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(setq-default flycheck-disabled-checkers '(python-flake8 python-pycompile))

(defun orion-get-pylint-executable ()
  "Returns pylint executable path"
  (let ((exec-path (python-shell-calculate-exec-path)))
    (executable-find "pylint")))

(defun orion-python-mode-hook ()
  "Configure executables used for linting and code navigation"
  (add-hook 'hack-local-variables-hook
	    (lambda ()
	      (message (orion-get-pylint-executable))
	      (setq-local flycheck-python-pylint-executable (orion-get-pylint-executable)))))

(add-hook 'python-mode-hook 'orion-python-mode-hook)

(local-unset-key (kbd "C-c C-r"))

(provide 'orion-python)
;;; orion-python.el ends here
