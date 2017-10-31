;;; Code:

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-word-1)
	 ("M-:" . avy-goto-char-timer)
	 ("C-\"" . avy-goto-char-timer)))


(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	magit-completing-read-function 'ivy-completing-read
	projectile-completion-system 'ivy
	counsel-git-cmd "rg --files"
	counsel-rg-base-command "rg -i -M 120 --no-heading --line-number --color never %s .")
  :bind (("C-c C-r" . ivy-resume)
	 ("C-s" . swiper)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c j" . counsel-rg))
  :init
  (ivy-mode 1))


(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t
  :bind (("M-y" . counsel-yank-pop)
	 :map ivy-minibuffer-map
	 ("M-y" . ivy-next-line)))


;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-mode))

(use-package company
  :diminish company-mode
  :ensure t
  :config
  (setq company-idle-delay 0.4
	company-tooltip-limit 10
	;; company-dabbrev-downcase nil
	company-minimum-prefix-length 1
	company-tooltip-flip-when-above t
	company-backends
	'((company-files
	   company-keywords
	   ;; company-capf
	   company-yasnippet
	   )
	  (company-abbrev company-dabbrev)
	  ))
  ;; :bind (("M-/" . company-capf))
  :init
  (global-company-mode 1))


(provide 'orion-navigation)
;;; orion-navigation.el ends here
