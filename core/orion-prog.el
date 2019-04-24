;;; Code:


;; (use-package ggtags
;;   :straight t
;;   :diminish ggtags-mode
;;   :init (add-hook 'prog-mode-hook (lambda () (ggtags-mode 1))))


(use-package counsel-gtags
  :straight t
  :diminish counsel-gtags-mode
  :bind ("C-t d" . counsel-gtags-find-definition)
  :init (add-hook 'prog-mode-hook (lambda () (counsel-gtags-mode 1))))

;; (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
;;   (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
;;   (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
;;   (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward))


(use-package flycheck
  :straight t
  :diminish flycheck-mode
  :init (global-flycheck-mode))


;; (use-package rainbow-delimiters
;;   :straight t
;;   :defer t
;;   :init
;;   (progn
;;     (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)))


(use-package smartparens-config
  :straight smartparens
  :diminish smartparens-mode
  :init
  (setq sp-base-key-bindings 'paredit
	sp-autoskip-closing-pair 'always
	sp-hybrid-kill-entire-symbol nil)
  :config
  (sp-use-paredit-bindings)
  (show-smartparens-global-mode +1)
  (smartparens-global-mode +1))

(which-func-mode 1)

(use-package yasnippet
  :straight t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))


(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))


(provide 'orion-prog)
;;; orion-prog.el ends here
