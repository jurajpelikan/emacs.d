;;; Package --- Python mode configuration
;;; Commentary:
;;; Code:

(require 'use-package)


(use-package lsp-mode
  :straight t
  :config
  ;; (setq lsp-auto-guess-root t)
  :init
  (setq lsp-auto-guess-root t)
  ;; (advice-add 'lsp--calculate-root :override )
  (defun lsp--calculate-root (session file-name)
    "Calculate project root for FILE-NAME in SESSION."
    (lsp--suggest-project-root))
  (add-hook 'python-mode-hook #'lsp))


(use-package company-lsp
  :straight t
  :after lsp-mode company
  :commands company-lsp
  :init
  (push 'company-lsp company-backends)
  :config
  (setq company-lsp-enable-recompletion t))


(defun orion-python/lsp-initialization-options ()
  "Read custom init options from project config file."
  (message (lsp-workspace-root))
  (json-read-file  (concat
		    (file-name-as-directory (lsp-workspace-root))
		    "etc/lsp-config.json")))


(defun orion-python/lsp-start-callback (workspace _params)
  "Python lsp start callback.

WORKSPACE is just used for logging and _PARAMS is unused."
  (lsp-workspace-status "::Started" workspace)
  (message "Python language server started whoo hoo"))

lsp-auto-guess-root

(defvar orion-python/lsp-notification-handlers
  (lsp-ht ("python/languageServerStarted" 'orion-python/lsp-start-callback)
          ("telemetry/event" 'ignore)
          ("python/reportProgress" 'ignore)
          ("python/beginProgress" 'ignore)
          ("python/endProgress" 'ignore)))


(defun orion-python/parse-virtualenv-project-file (project-file)
  "Return path from virtualenv PROJECT-FILE."
  (with-temp-buffer
    (insert-file-contents project-file)
    (file-name-as-directory (s-trim (buffer-string)))))


(defun orion-python/projectile-root-virtualenv (dir)
  "Try to find virtualenv .project file in parents of DIR.

Return project root from .project file."
  (let ((project-dir
	 (projectile-locate-dominating-file dir ".project")))
    (if project-dir
	(orion-python/parse-virtualenv-project-file
	 (concat (file-name-as-directory project-dir) ".project")))))

(use-package orion-pylinter)

(use-package python
  :after lsp-mode
  :general
  (python-mode-map
   "C-c C-r" nil
   "C-c C-p" nil
   "M-." 'lsp-find-definition)
  :init
  (add-to-list 'projectile-project-root-files-functions 'orion-python/projectile-root-virtualenv t)
  (setq-default flycheck-disabled-checkers
		'(python-pycompile
		  python-pylint
		  python-flake8))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "ls-python")
    :major-modes '(python-mode)
    :server-id 'mspyls
    :priority 1
    :initialization-options 'orion-python/lsp-initialization-options
    :notification-handlers orion-python/lsp-notification-handlers)))


;; (use-package lsp-python-ms
;;   :straight (:host github :repo "andrew-christianson/lsp-python-ms")
;;   :hook (python-mode . lsp)
;;   :config

  ;; (add-hook 'python-mode-hook 'orion-python-mode-hook)
  ;; (add-hook 'python-mode-hook
  ;; 	    (lambda ()
  ;; 	      (set (make-local-variable 'company-backends) '(company-lsp
  ;; 							     ;; company-jungle/backend
  ;; 							     company-files))))
  ;; (add-hook 'python-mode-hook 'anaconda-mode)
  ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)



;; (unbind-key "C-c C-p" python-mode-map)

 
;; (use-package lsp-mode
;;   :straight t
;;   :commands lsp
;;   :init
;;   (setq lsp-print-io t
;;	lsp-trace t)
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-stdio-connection "/Users/juraj/bin/ls-python")
;;		    :major-modes '(python-mode)
;;		    :server-id 'ls-python))
;;   )


;; (defun lsp-python-ms--extra-init-params (&optional workspace)
;;   "Return form describing parameters for language server.
;; Old lsp will pass in a WORKSPACE, new lsp has a global
;; lsp-workspace-root function that finds the current buffer's
;; workspace root.  If nothing works, default to the current file's
;; directory"
;;   `(:interpreter
;;     (:properties (:InterpreterPath "/Users/juraj/Envs/account-storage/bin/python"
;;				   ;; this database dir will be created if required
;;				   :DatabasePath "~/.emacs.d/.ls-python"
;;				   :Version "3.7.0"))
;;     ;; preferredFormat "markdown" or "plaintext"
;;     ;; experiment to find what works best -- over here mostly plaintext
;;     :displayOptions (
;;		     :preferredFormat "plaintext"
;;		     :trimDocumentationLines :json-false
;;		     :maxDocumentationLineLength 0
;;		     :trimDocumentationText :json-false
;;		     :maxDocumentationTextLength 0)
;;     ))

;; (defun lsp-python-ms--language-server-started-callback (workspace _params)
;;   "Handle the python/languageServerStarted message.
;; WORKSPACE is just used for logging and _PARAMS is unused."
;;   (lsp-workspace-status "::Started" workspace)
;;   (message "Python language server started"))

;; (lsp-register-client
;;  (make-lsp-client
;;   :new-connection (lsp-stdio-connection 'lsp-python-ms--command-string)
;;   :major-modes '(python-mode)
;;   :server-id 'mspyls
;;   :priority 1
;;   :initialization-options 'lsp-python-ms--extra-init-params
;;   :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;				 ("telemetry/event" 'ignore)
;;				 ;; TODO handle this more gracefully
;;				 ("python/reportProgress" 'ignore)
;;				 ("python/beginProgress" 'ignore)
;;				 ("python/endProgress" 'ignore))))



;; (use-package python
;;   :config
;;   (setq-default flycheck-disabled-checkers '(python-pycompile
;;					     python-pylint
;;					     python-flake8))
;;   :bind (:map python-mode-map
;;	      (("C-c C-r" . nil)))
;;   :init
;;   (unbind-key "C-c C-p" python-mode-map)
;;   ;; (add-hook 'python-mode-hook 'orion-python-mode-hook)
;;   (add-hook 'python-mode-hook
;;	    (lambda ()
;;	      (set (make-local-variable 'company-backends) '(company-lsp
;;							     ;; company-jungle/backend
;;							     company-files))))
;;   ;; (add-hook 'python-mode-hook 'anaconda-mode)
;;   ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   )

;; ;; (lsp-register-client
;; ;;  (make-lsp-client
;; ;;   :new-connection (lsp-stdio-connection 'lsp-python-ms--command-string)
;; ;;   :major-modes '(python-mode)
;; ;;   :server-id 'mspyls
;; ;;   :priority 1
;; ;;   :initialization-options 'lsp-python-ms--extra-init-params
;; ;;   :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;; ;;				 ("telemetry/event" 'ignore)
;; ;;				 ;; TODO handle this more gracefully
;; ;;				 ("python/reportProgress" 'ignore)
;; ;;				 ("python/beginProgress" 'ignore)
;; ;;				 ("python/endProgress" 'ignore)))





(provide 'orion-python-lsp)
;;; orion-python-lsp.el ends here
