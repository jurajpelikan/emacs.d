;;; Code:

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t
	magit-completing-read-function 'ivy-completing-read
	projectile-completion-system 'ivy)
  (unbind-key (kbd "C-c C-r"))
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  :init
  (ivy-mode 1))

(projectile-mode)

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package company
  :config
  (setq company-idle-delay 0.5
	company-tooltip-limit 10
	company-minimum-prefix-length 2
	company-tooltip-flip-when-above t)
  (add-to-list 'company-backends 'company-anaconda)
  :init
  (global-company-mode 1))

(provide 'orion-completion)

;;; orion-completion.el ends here
