;;; orion-virtualenv.el --- custom virtual env activation

;;; Commentary:

;; Automatically set the virtualenv root from workon-home if a virtualenv with
;; the same name as the current project exists.

;;; Code:

(require 'projectile)
(require 'python)

(defvar orion-virtualenv-workon-home (or (getenv "WORKON_HOME")
                                             (expand-file-name "~/Envs"))
  "The $WORKON_HOME path.")

(defun orion-virtualenv-init-from-workon-home ()
  "Set the current virtualenv for this buffer."
  (let* ((name (projectile-project-name))
         (venv-dir (expand-file-name name orion-virtualenv-workon-home)))
    (when (file-directory-p venv-dir)
      (print venv-dir)
      (setq-local python-shell-virtualenv-root venv-dir))))

(provide 'orion-virtualenv)
;;; orion-virtualenv.el ends here
