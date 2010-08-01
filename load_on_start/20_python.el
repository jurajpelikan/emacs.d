(require 'python-mode)

(when (load "flymake" t)
  (defun flymake-pylint-init ()
	(let* ((temp-file (flymake-init-create-temp-buffer-copy
					   'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
	  (list "python_syntax" (list local-file))))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

;; Python stuff for outline mode. 
(defvar py-outline-regexp 
  "^\\([ \t]*\\)\\(def\\|class\\|if\\|elif\\|else\\|while\\|for\\|try\\|except\\|with\\)" 
  "This variable defines what constitutes a 'headline' to outline mode.") 

(defun py-outline-level () 
  "Report outline level for Python outlining." 
  (save-excursion 
    (end-of-line) 
    (let ((indentation (progn 
						 (re-search-backward py-outline-regexp) 
						 (match-string-no-properties 1)))) 
      (if (and (> (length indentation) 0) 
			   (string= "\t" (substring indentation 0 1))) 
		  (length indentation) 
		(/ (length indentation) py-indent-offset))))) 

(defun my-python-mode-hook ()
  (setq major-mode 'python-mode)
  (setq indent-tabs-mode nil)
  (guess-style-guess-all)
  (pabbrev-mode)
  (setq
   outline-regexp py-outline-regexp
   outline-level 'py-outline-level) 
  (outline-minor-mode 1)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; rope init
(require 'pymacs) 
(pymacs-load "ropemacs" "rope-") 
;; ropemacs variables 
(setq ropemacs-confirm-saving 'nil) 
(setq ropemacs-enable-autoimport 't) 
(setq ropemacs-autoimport-modules '("os" "shutil")) 
(setq ropemacs-autoimport-underlineds 't) 

(defadvice pymacs-terminate-services 
  (around stfu compile activate) 
  (flet ((yes-or-no-p (&rest args) t) (y-or-n-p (&rest args) t)) ad-do-it))

