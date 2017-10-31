;; Code

(use-package eshell
  :ensure t
  :init
  (setq eshell-where-to-jump 'begin)
  (setq eshell-review-quick-commands nil)
  (setq eshell-smart-space-goes-to-end t))


(use-package em-smart)

(provide 'orion-eshell)
;; orion-editor.el ends here
