;;; Code:
(require 'flycheck)

(use-package company-anaconda
  :straight t)


(use-package anaconda-mode
  :straight t
  :bind (("M-." . anaconda-mode-find-definitions))
  :diminish anaconda-mode eldoc-mode)


(use-package sphinx-doc
  :straight t
  :diminish sphinx-doc-mode)


(use-package orion-pylinter)

(use-package orion-jungle)

(use-package python
  :config
  (setq-default flycheck-disabled-checkers '(python-pycompile
					     python-pylint
					     python-flake8))
  :bind (:map python-mode-map
	      (("C-c C-r" . nil)))
  :init
  (unbind-key "C-c C-p" python-mode-map)
  )

(defun orion-python/split-string ()
  "Split python string on 80th character plus one word."
  (interactive)
  (if (> (orion-line-length) 80)
      (progn
	(move-to-column 80)
	(forward-word)
    	(insert " \"")

    	(newline-and-indent)
	(insert "\"")
	)
    )
  )

(defun orion-python/join-python-string ()
  "Join multiple line python string."
  (interactive)
  (progn
    (join-line)
    (delete-char 2)
    (delete-char -1))
  )

(provide 'orion-python)
;;; orion-python.el ends here
