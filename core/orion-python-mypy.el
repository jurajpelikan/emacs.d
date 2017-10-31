;;; Code:

(require 'flycheck)


(flycheck-def-config-file-var flycheck-mypy-ini python-mypy
			      ".pylintrc"
  :safe #'stringp)

(flycheck-define-checker python-mypy
  "Mypy syntax checker. Requires mypy>=0.3.1.
Customize `flycheck-python-mypy-args` to add specific args to default
executable.
E.g. when processing Python2 files, add \"--py2\".
See URL `http://mypy-lang.org/'."

  :command ("mypy"
	    (config-file "--config-file" flycheck-mypy-ini)

	    source-original)
  :error-patterns
  ((error line-start (file-name) ":" line ": error:" (message) line-end))
  :modes python-mode)



(defun virtualenv-get-executable (name)
  "Return executable path.

NAME name of executable to find"
  (let ((exec-path (python-shell-calculate-exec-path)))
    (executable-find name)))


(defun orion-python-mypy-mode-hook ()
  "Configure executables used for linting and code navigation."
  (add-hook
   'hack-local-variables-hook
   (lambda ()
     (setq-local
      flycheck-python-mypy-executable
      (virtualenv-get-executable "mypy")))))

(add-to-list 'flycheck-checkers 'python-mypy t)
(add-hook 'python-mode-hook 'orion-python-mypy-mode-hook)

(provide 'orion-python-mypy)
;;; orion-python-mypy.el ends here
