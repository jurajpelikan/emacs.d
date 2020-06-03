;;; Code:

(use-package avy
  :straight t
  :bind (("C-:" . avy-goto-word-1)
	 ("M-:" . avy-goto-char-timer)
	 ("C-\"" . avy-goto-char-timer)))


(use-package ivy
  :straight (:host github :repo "abo-abo/swiper")
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	magit-completing-read-function 'ivy-completing-read
	projectile-completion-system 'ivy
	counsel-git-cmd "rg --files"
	counsel-rg-base-command "rg -i -M 120 --no-heading --line-number --color never %s ."
	)
  :general
  ("C-c C-r" 'ivy-resume
   "C-s" 'swiper
   "M-x" 'counsel-M-x
   "C-x C-f" 'counsel-find-file
   "C-c j" 'counsel-grep
   "M-y" 'counsel-yank-pop)
  (:keymaps 'ivy-occur-grep-mode-map
  	    "n" 'ivy-occur-next-line
  	    "p" 'ivy-occur-previous-line)
  :init
  (ivy-mode 1))


;; (use-package counsel
;;   :straight t
;;   :bind (("M-y" . counsel-yank-pop)
;; 	 :map ivy-minibuffer-map
;; 	 ("M-y" . ivy-next-line)))


(use-package counsel-projectile
  :straight t
  :config
  (counsel-projectile-mode))

;; (define-key keymap (kbd "M-n") 'company-select-next)
;;     (define-key keymap (kbd "M-p") 'company-select-previous)

(use-package company
  :diminish company-mode
  :straight t
  :general
  (:keymaps 'company-active-map
	    "C-n" 'company-select-next
	    "C-p" 'company-select-previous)
  :config
  (setq company-idle-delay 0.4
	company-tooltip-limit 10
	;; company-dabbrev-downcase nil
	company-minimum-prefix-length 1
	company-tooltip-flip-when-above t
	;; company-backends
	;; '((company-files
	;;    company-keywords
	;;    ;; company-capf
	;;    company-yasnippet
	;;    )
	;;   (company-abbrev company-dabbrev)
	;;   )
	)
  ;; :bind (("M-/" . company-capf))
  :init
  (global-company-mode 1))


(use-package prescient
  :straight t)

(use-package ivy-prescient
  :straight t)

(use-package company-prescient
  :straight t)


(provide 'orion-navigation)
;;; orion-navigation.el ends here
