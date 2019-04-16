;;; Code:

(require 'flycheck)


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


(add-to-list 'flycheck-checkers 'orion-pylinter t)

(provide 'orion-pylinter)
;;; orion-pylinter.el ends here
