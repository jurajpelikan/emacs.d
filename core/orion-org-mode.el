;;; Code:


(use-package org
  :straight t
  :config
  ;; AGENDA
  (defun orion-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
	  (pri-value (* 1000 (- org-lowest-priority priority)))
	  (pri-current (org-get-priority (thing-at-point 'line t))))
      (if (= pri-value pri-current)
	  subtree-end
	nil)))

  (defun orion-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (string= (org-entry-get nil "STYLE") "habit")
	  subtree-end
	nil)))

  (setq org-todo-keywords '((sequence "TODO" "WIP" "BLOCKED" "|" "DONE" "CANCELED"))
	org-agenda-files '("~/Notes/inbox.org")
	org-agenda-span 1
	org-agenda-custom-commands '(("c" "Simple agenda view"
				      ((tags
					"PRIORITY=\"A\""
					((org-agenda-skip-function
					  '(org-agenda-skip-entry-if 'todo 'done))
					 (org-agenda-overriding-header
					  "High-priority unfinished tasks:")))
				       (agenda "")
				       (alltodo ""
						((org-agenda-skip-function '(or (orion-org-skip-subtree-if-habit)
										(orion-org-skip-subtree-if-priority ?A)
										(org-agenda-skip-if nil '(scheduled deadline))))
						 (org-agenda-overriding-header "ALL normal priority tasks:"))))

				      ((org-agenda-compact-blocks t)))))

  ;; BABEL
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (clojure . t)))
  (setq org-confirm-babel-evaluate nil)
  (defadvice org-edit-src-code (around set-buffer-file-name activate compile)
    (let ((file-name (buffer-file-name)))
      ad-do-it
      (setq buffer-file-name file-name)))
  )

(use-package org-projectile
  :bind (("C-' p" . org-projectile-project-todo-completing-read)
	 ("C-' c" . org-capture))
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "notes.org"
	org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :straight t
  :after org)

(defun orion-org-mode/goto-project-notes ()
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name))
  )

(provide 'orion-org-mode)
;;; orion-org-mode.el ends here
