;;; Code:
(require 'flycheck)

(use-package company-anaconda
  :ensure t)


(use-package anaconda-mode
  :ensure t
  :bind (("M-." . anaconda-mode-find-definitions))
  :diminish anaconda-mode eldoc-mode)


(use-package sphinx-doc
  :ensure t
  :diminish sphinx-doc-mode)


;; (use-package pytest
;;   :ensure t
;;   :bind (:map python-mode-map
;;	      (("C-c ." . 'pytest-pdb-one))))

(use-package orion-pylinter)
(use-package orion-jungle)


(defun orion-python-mode-hook ()
  "Configure company backaneds"
  (add-hook
   'hack-local-variables-hook
   (lambda ()
     (sphinx-doc-mode t)
     (set (make-local-variable 'company-backends)
	  '(
	    (
	     company-jungle/backend
	     ;; company-anaconda
	     company-files)
	    )))))

(use-package python
  :config
  (setq-default flycheck-disabled-checkers '(python-pycompile
					     python-pylint
					     python-flake8))
  :bind (:map python-mode-map
	      (("C-c C-r" . nil)))
  :init
  (unbind-key "C-c C-p" python-mode-map)
  (add-hook 'python-mode-hook 'orion-python-mode-hook)
  ;; (add-hook 'python-mode-hook 'anaconda-mode)
  ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )


(provide 'orion-python)
;;; orion-python.el ends here
