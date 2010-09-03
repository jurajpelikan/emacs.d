;; add lisp and subdirs to load path
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir (concat 
                         (file-name-as-directory 
                          (file-name-directory load-file-name)) 
                         "lisp"))
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

(setq emacsd-path (concat 
                        (file-name-as-directory 
                         (file-name-directory load-file-name))))

;; set env variables depending on path
(setenv "PYMACS_PYTHON" (concat 
                         (file-name-as-directory 
                          (file-name-directory load-file-name)) "emacs_python/bin/python")) 

(setenv "PATH" (concat
			   emacsd-path "emacs_python/bin:" (getenv "PATH")))

;; load startup files
(load-file (concat emacsd-path "lisp/debian-startup.el"))
(debian-run-directories (concat emacsd-path "/load_on_start"))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil))))
