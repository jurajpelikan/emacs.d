;;; Code:

(use-package flycheck
  :init (global-flycheck-mode))

(yas-global-mode 1)


(defun orion-org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
		  org-level-2
		  org-level-3
		  org-level-4
		  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

(add-hook 'org-mode-hook 'orion-org-mode-hook)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'smartparens-config)
(move-text-default-bindings)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(provide 'orion-prog)
;;; orion-prog.el ends here
