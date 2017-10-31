;;; Code:
(use-package prodigy
  :ensure t)


(prodigy-define-service
  :name "jungle"
  :command "/Users/juraj/Envs/jungle/bin/inv"
  :args '("run")
  :port 1337
  :cwd "/Users/juraj/Code/ide-tools/jungle"
  :ready-message "Starting worker")

(provide 'orion-services)
;;; orion-services.el ends here
