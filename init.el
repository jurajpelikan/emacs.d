;; add lisp and subdirs to load path
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir (concat 
                         (file-name-as-directory 
                          (file-name-directory load-file-name)) 
                         "lisp"))
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

(setq juraj-emacs-path (concat 
                        (file-name-as-directory 
                         (file-name-directory load-file-name))))

;; set env variables depending on path
(setenv "PYMACS_PYTHON" (concat 
                         (file-name-as-directory 
                          (file-name-directory load-file-name)) "emacs_python/bin/python")) 

(setenv "PATH" (concat
			   juraj-emacs-path "emacs_python/bin:" (getenv "PATH")))

;; load startup files
(load-file "~/juraj-emacs/lisp/debian-startup.el")
(debian-run-directories "~/juraj-emacs/load_on_start")

(put 'downcase-region 'disabled nil)
