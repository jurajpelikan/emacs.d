;;; flycheck-virtualenv.el --- Setup Flycheck by Virtualenv

;;; Commentary:

;; Setup Flycheck according to the current virtualenv.

;;; Code:

(require 'flycheck)

;; We can safely declare this function, since we'll only call it in Python Mode,
;; that is, when python.el was already loaded.
(declare-function python-shell-calculate-exec-path "python")

(defun flycheck-virtualenv-set-python-executables ()
  "Set Python executables for the current buffer."
  (let ((exec-path (python-shell-calculate-exec-path)))
    (setq-local flycheck-python-pylint-executable
                (executable-find "pylint"))))

(defun flycheck-virtualenv-setup ()
  "Setup Flycheck for the current virtualenv."
  (when (derived-mode-p 'python-mode)
    (add-hook 'hack-local-variables-hook
              #'flycheck-virtualenv-set-python-executables 'local)))

(flycheck-define-checker python-pylint
  "A Python syntax and style checker using Pylint.

This syntax checker requires Pylint 1.0 or newer.

See URL `https://www.pylint.org/'."
  ;; -r n disables the scoring report
  :command ("pylint" "-r" "n"
            "--msg-template"
            (eval (if flycheck-pylint-use-symbolic-id
                      "{path}:{line}:{column}:{C}:{symbol}:{msg}"
                    "{path}:{line}:{column}:{C}:{msg_id}:{msg}"))
            (config-file "--rcfile" flycheck-pylintrc)
            ;; Need `source-inplace' for relative imports (e.g. `from .foo
            ;; import bar'), see https://github.com/flycheck/flycheck/issues/280
            source-original)
  :error-filter
  (lambda (errors)
    (flycheck-sanitize-errors (flycheck-increment-error-columns errors)))
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":"
          (or "E" "F") ":"
          (id (one-or-more (not (any ":")))) ":"
          (message) line-end)
   (warning line-start (file-name) ":" line ":" column ":"
            (or "W" "R") ":"
            (id (one-or-more (not (any ":")))) ":"
            (message) line-end)
   (info line-start (file-name) ":" line ":" column ":"
         "C:" (id (one-or-more (not (any ":")))) ":"
         (message) line-end))
  :modes python-mode)

(provide 'flycheck-virtualenv)
;;; flycheck-virtualenv.el ends here
