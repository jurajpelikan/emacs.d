;; Code

(use-package super-save
  :straight t
  :config
  (super-save-mode +1))


(setq backup-directory-alist `((".*" . ,orion-save-dir))
      auto-save-file-name-transforms `((".*" ,orion-save-dir t))
      undo-tree-auto-save-history t
      recentf-save-file (expand-file-name "recentf" orion-save-dir)
      
      )


(setq auto-save-file-name-transforms
      `((".*" ,orion-save-dir t)))


(setq undo-tree-history-directory-alist
      `((".*" . ,orion-save-dir)))


(setq undo-tree-auto-save-history t)


;; (use-package desktop
;;   :straight t
;;   :defer 1
;;   :config
;;   (setq desktop-save t
;; 	desktop-path (list orion-save-dir)
;; 	desktop-dirname orion-save-dir)
;;   :init
;;   (desktop-save-mode t))


(provide 'orion-autosave)
;;; orion-autosave.el ends here
