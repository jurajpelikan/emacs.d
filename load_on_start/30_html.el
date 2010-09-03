(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 
          (lambda () 
            (zencoding-mode t)))
(load (concat emacsd-path "lisp/nxhtml/autostart.el"))

(add-to-list 'auto-mode-alist
			 '("\\.html\\'" . django-html-mumamo-mode))

(add-to-list 'auto-mode-alist
			 '("\\.rml\\'" . django-html-mumamo-mode))

