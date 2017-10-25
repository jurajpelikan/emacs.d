;; Code

(use-package  dired-x)
(use-package crux
  :config
  (global-set-key (kbd "C-^") 'crux-top-join-line)
  (global-set-key (kbd "C-k") 'crux-smart-kill-line)
  (global-set-key (kbd "C-S-RET") 'crux-smart-open-line-above)
  (global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
  (global-set-key (kbd "C-c f") 'crux-recentf-find-file)
  (global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
  (global-set-key (kbd "C-c M-d") 'crux-duplicate-and-comment-current-line-or-region)
  (global-set-key (kbd "C-c r") 'crux-rename-file-and-buffer)
  (global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line))


(global-unset-key (kbd "s-k"))

(use-package expand-region
  :config
  (global-set-key (kbd "C-.") 'er/expand-region))

(use-package smartparens-config
  :config
  (setq sp-base-key-bindings 'paredit
	sp-autoskip-closing-pair 'always
	sp-hybrid-kill-entire-symbol nil)
  (sp-use-paredit-bindings)
  (show-smartparens-global-mode +1))

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(sml/setup)

(setq ns-function-modifier 'hyper)

;; Newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(move-text-default-bindings)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq orion-auto-save t)
;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun orion-auto-save-command ()
  "Save the current buffer if `orion-auto-save' is not nil."
  (when (and orion-auto-save
	     buffer-file-name
	     (buffer-modified-p (current-buffer))
	     (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands class &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.
The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
		 `(defadvice ,command (,class ,(intern (concat (symbol-name command) "-" advice-name)) activate)
		    ,@body))
	       commands)))

;; advise all window switching functions
(advise-commands "auto-save"
		 (switch-to-buffer other-window windmove-up windmove-down windmove-left windmove-right)
		 before
		 (orion-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'orion-auto-save-command)

(provide 'orion-editor)
;; orion-editor.el ends here
