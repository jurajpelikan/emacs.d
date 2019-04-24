;;; Code

(global-linum-mode)
(global-unset-key (kbd "s-k"))
(global-unset-key (kbd "C-t"))
(global-auto-revert-mode t)
(delete-selection-mode t)

(setq ns-function-modifier 'hyper
      require-final-newline t
      create-lockfiles nil
      mac-option-modifier 'meta
      find-program "/usr/bin/find"
      dired-use-ls-dired nil
      ns-use-proxy-icon nil
      )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package general
  :straight t)


(use-package diminish
  :straight t)


(use-package powerthesaurus
  :straight t)


(use-package multiple-cursors
  :straight t)


(use-package exec-path-from-shell
  :straight t
  :init
  (exec-path-from-shell-initialize))


(use-package projectile
  :straight t
  :diminish projectile-mode
  :init
  (setq projectile-enable-caching nil
	projectile-cache-file (expand-file-name
			       "projectile.cache"
			       orion-save-dir)
	projectile-known-projects-file (expand-file-name
					"projectile-bookmarks.eld"
					orion-save-dir))
  (projectile-mode 1))


(use-package undo-tree
  :straight t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode))


(use-package which-key
  :straight t
  :diminish which-key-mode
  :init
  (which-key-mode +1))


(use-package dired-x)


(use-package crux
  :straight t
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
  :straight t
  :bind (("C-." . er/expand-region)))


(use-package smex
  :straight t)


(use-package guru-mode
  :straight t
  :diminish guru-mode
  :config
  (guru-global-mode +1))


(use-package move-text
  :straight t
  :bind (("M-p" . move-text-up)
	 ("M-n" . move-text-down))
  :config
  (move-text-default-bindings))


;; Provide a new MAJORMODE-local-vars-hook
 (add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
 (defun run-local-vars-mode-hook ()
   "Run a hook for the major-mode after the local variables have been processed."
   (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))

;; (diminish 'auto-revert-mode)

;; (use-package mac-pseudo-daemon
;;   :straight t)


;; (add-hook 'server-switch-hook
;; 	  (lambda () (select-frame-set-input-focus (selected-frame))))


(provide 'orion-global)
;;; orion-global.el ends here
