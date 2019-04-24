;;; Package --- Pylinter flycheck configuration
;;; Commentary:
;;; Code:


(require 'flycheck)

(defun orion-pylinter/locate-config ()
  "Return path to pylinter config.
This method doesnt check if it exists."
  (concat
   (file-name-as-directory (projectile-project-root))
   "etc/pylinter/config"))


(flycheck-def-config-file-var orion-pylinter-config orion-pylinter ""
  :safe #'stringp)

(flycheck-define-checker orion-pylinter
  "Pylinter flycheck checker"
  :command ("pylinter"
	    (config-file "--config" orion-pylinter-config)
	    source-original)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (message) line-end))
  :modes python-mode)


(add-hook 'python-mode-local-vars-hook
           (lambda () (setq-local orion-pylinter-config (orion-pylinter/locate-config))))

(add-to-list 'flycheck-checkers 'orion-pylinter t)

(provide 'orion-pylinter)
;;; orion-pylinter.el ends here
