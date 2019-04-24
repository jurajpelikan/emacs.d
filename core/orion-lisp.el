;;; Code:


(use-package slime
  :straight t
  :config
  (progn
    (setq inferior-lisp-program "/usr/bin/sbcl")
    (slime-setup)))

(provide 'orion-lisp)
;;; orion-python.el ends here
