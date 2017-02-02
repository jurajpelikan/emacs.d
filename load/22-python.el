;; Python configuration

(setq-default flycheck-disabled-checkers '(python-flake8 python-pycompile))

(setenv "WORKON_HOME" "/Users/juraj/Envs")

;; (use-package orion-virtualenv       ; Personal virtualenv tools
;;   :load-path "lisp/"
;;   :commands (orion-virtualenv-init-from-workon-home)
;;   :init (add-hook 'python-mode-hook #'orion-virtualenv-init-from-workon-home))

(use-package flycheck-virtualenv        ; Setup Flycheck by virtualenv
  :load-path "lisp/"
  :after python
  :commands (flycheck-virtualenv-setup)
  :config (add-hook 'flycheck-mode-hook #'flycheck-virtualenv-setup))


;; (add-hook 'python-mode-hook (lambda () 'anaconda-mode 'flyspell-prog-mode))
(add-hook 'python-mode-hook 'anaconda-mode)


(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
