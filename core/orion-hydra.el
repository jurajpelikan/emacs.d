;;; Code:

(use-package hydra
  :ensure t
  :config
  (unbind-key "C-z")
  (unbind-key "C-/" undo-tree-map)
  (unbind-key "C-?" undo-tree-map))


(defhydra orion-hydra/undo-tree (:columns 3)
  "Undo tree hydra"
  ("u" undo-tree-undo "Undo")
  ("r" undo-tree-redo "Redo")
  ("t" undo-tree-visualize "Tree")
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/dired (:columns 3)
  "Dired hydra"
  ("." dired-jump "Open here")
  ("f" find-name-dired "Find files")
  ("g" counsel-rg "Grep")
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/ibuffer (:columns 3 :body-pre (ibuffer))
  "Ibuffer hydra"
  ("n" ibuffer-forward-line "Forward")
  ("RET" ibuffer-visit-buffer "Visit")
  ("p" ibuffer-backward-line "Bacward")
  ("m" ibuffer-mark-forward "Mark forward")
  ("u" ibuffer-unmark-forward "Unmark forward")
  ("D" ibuffer-do-delete "Delete")
  ("S" ibuffer-do-save "Save")
  ("g" ibuffer-update "Update")
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/projectile (:columns 3)
  "Projectile hydra"
  ("g" counsel-rg "Grep" :exit t)
  ("f" projectile-find-file "Find file" :exit t)
  ("o-f" projectile-find-file-other-window "Find file other window" :exit t)
  ("K" projectile-kill-buffers "Kill buffers" :exit t)
  ("o" projectile-multi-occur "Occur" :exit t)
  ("p" projectile-switch-project "Switch project" :exit t)
  ("s" projectile-switch-project "Switch project" :exit t)
  ("z" projectile-cache-current-file "Cache current" :exit t)
  ("c" projectile-invalidate-cache "Invalidate cache" :exit t)
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/shortcut (:columns 3)
  "Shortcut hydra"
  ("/" projectile-find-file "Find file in project" :exit t)
  ("." dired-jump "Dired here" :exit t)
  (";" counsel-imenu "Imenu" :exit t)
  ("'" counsel-rg "Grep" :exit t)
  ("p" projectile-switch-project "Switch project" :exit t)
  ;; ("c"  "Org caprture" :exit t)
  ("t" orion-org-mode/goto-project-notes "Goto project tasks")
  ("c" org-projectile-capture-for-current-project "Capture task" :exit t)
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/smerge (:columns 3)
  "Smerge hydra"
  ("n" smerge-next "Next")
  ("p" smerge-prev "Prev")
  ("c" smerge-keep-current "Keep current")
  ("b" smerge-keep-base "Keep base")
  ("m" smerge-keep-mine "Keep mine")
  ("o" smerge-keep-other "Keep Other")
  ("a" smerge-keep-all "Keep All")
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/multi-line-editing (:columns 3)
  ("b" mc/edit-beginnings-of-lines: "Add at beginning")
  ("e" mc/edit-ends-of-lines "Add at end")
  ("q" nil "exit" :exit t))

(defhydra orion-hydra/smartparens (:columns 3)
  ("a" sp-beginning-of-sexp "Beginning of sexp")
  ("e" sp-end-of-sexp "End of sexp")
  ("f" sp-forward-sexp "Forward sexp")
  ("b" sp-backward-sexp "BAckward previous")
  ("n" sp-next-sexp "Start or next or outer")
  ("p" sp-previous-sexp "End or previos or outer")
  ("<" sp-down-sexp "Begining of current or next")
  (">" sp-up-sexp "End of current or outer")
  ("q" nil "exit" :exit t))


(defhydra orion-hydra/root (:columns 3)
  "Root hydra to explore all others"
  ("u" orion-hydra/undo-tree/body "undo-tree" :exit t)
  ("d" orion-hydra/dired/body "dired" :exit t)
  ("b" orion-hydra/ibuffer/body "ibuffer" :exit t)
  ("p" orion-hydra/projectile/body "projectile" :exit t)
  ("sm" orion-hydra/smerge/body "smerge" :exit t)
  ("a" orion-hydra/smartparens/body "smartparens" :exit t)
  ("/" orion-hydra/shortcut/body "shortcuts" :exit t)
  ("q" nil "exit" :exit t))

(global-set-key (kbd "C-?") 'orion-hydra/root/body)
(global-set-key (kbd "C-/") 'orion-hydra/shortcut/body)
(global-set-key (kbd "C-z") 'orion-hydra/shortcut/body)
(global-set-key (kbd "C->") 'orion-hydra/smartparens/body)

(provide 'orion-hydra)
;;; orion-hydra.el ends here
