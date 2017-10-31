;;; Code:

(use-package org
  :ensure t)

(use-package org-projectile
  :bind (("C-' p" . org-projectile-project-todo-completing-read)
	 ("C-' c" . org-capture))
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "notes.org"
	org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :ensure t
  :after org)

(defun orion-org-mode/goto-project-notes ()
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name))
  )

(provide 'orion-org-mode)
;;; orion-org-mode.el ends here
