(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

(load (concat emacsd-path "lisp/nxhtml/autostart.el"))

(add-to-list 'auto-mode-alist
			 '("\\.html\\'" . django-html-mumamo-mode))

