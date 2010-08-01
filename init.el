;; add lisp and subdirs to load path
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	(let* ((my-lisp-dir (concat 
						 (file-name-as-directory 
						  (file-name-directory load-file-name)) 
						 "lisp"))
		   (default-directory my-lisp-dir))
	  (setq load-path (cons my-lisp-dir load-path))
	  (normal-top-level-add-subdirs-to-load-path)))

(message "%s" (concat 
						 (file-name-as-directory 
						  (file-name-directory load-file-name)) "emacs_python/bin/python")) 

;; set env variables depending on path
(setenv "PYMACS_PYTHON" (concat 
						 (file-name-as-directory 
						  (file-name-directory load-file-name)) "emacs_python/bin/python")) 


(setq juraj-emacs-path (concat 
					   (file-name-as-directory 
						(file-name-directory load-file-name))))
;; load startup files
(load-file "~/juraj-emacs/lisp/debian-startup.el")
(debian-run-directories "~/juraj-emacs/load_on_start")
