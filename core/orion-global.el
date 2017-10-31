;;; Code

(global-linum-mode)
(global-unset-key (kbd "s-k"))
(global-unset-key (kbd "C-t"))
(global-auto-revert-mode t)
(delete-selection-mode t)

(diminish 'auto-revert-mode)
(setq ns-function-modifier 'hyper)
(setq require-final-newline t)
(setq create-lockfiles nil)
(setq mac-option-modifier 'meta)


;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme
(setq ns-use-proxy-icon nil)
;; (setq frame-title-format nil)

(use-package diminish
    :ensure t)

(use-package powerthesaurus
  :ensure t)

(use-package multiple-cursors
  :ensure t)


(use-package mac-pseudo-daemon
  :ensure t)


(add-hook 'server-switch-hook
	  (lambda () (select-frame-set-input-focus (selected-frame))))


(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))


(use-package desktop
  :ensure t
  :defer 1
  :config
  (setq desktop-save t
	desktop-path (list orion-save-dir)
	desktop-dirname orion-save-dir)
  :init
  (desktop-save-mode t))


(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-enable-caching nil
	projectile-cache-file (expand-file-name "projectile.cache" orion-save-dir))
  :init
  (projectile-mode))


(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory))
      undo-tree-auto-save-history t)
  :init
  (global-undo-tree-mode))


(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode +1))


(use-package dired-x)


(use-package crux
  :ensure t
  :bind (("C-^" . crux-top-join-line)
	 ("C-k" . crux-smart-kill-line)
	 ("C-S-RET" . crux-smart-open-line-above)
	 ("C-c n" . crux-cleanup-buffer-or-region)
	 ("C-c f" . crux-recentf-find-file)
	 ("C-c d" . crux-duplicate-current-line-or-region)
	 ("C-c M-d" . crux-duplicate-and-comment-current-line-or-region)
	 ("C-c r" . crux-rename-file-and-buffer)
	 ("C-c k" . crux-kill-other-buffers)
	 ("C-a" . crux-move-beginning-of-line)))


(use-package expand-region
  :ensure t
  :bind (("C-." . er/expand-region)))


(use-package smex
  :ensure t)


(use-package guru-mode
  :ensure t
  :diminish guru-mode
  :config
  (guru-global-mode +1))


(use-package move-text
  :ensure t
  :bind (("M-p" . move-text-up)
	 ("M-n" . move-text-down))
  :config
  (move-text-default-bindings))


(provide 'orion-global)
;;; orion-global.el ends here
