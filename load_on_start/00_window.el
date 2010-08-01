(require 'color-theme)
(require 'color-theme-tango)


;; fontlock auto
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)        ; GNU Emacs
  (setq font-lock-auto-fontify t))   ; XEmacs


(setq default-frame-alist '((font-backend . "xft")
                            (font . "Bitstream Vera Sans Mono-9")
                            ))


;; select theme - first list element is for windowing system, second is for console/terminal
    (setq color-theme-choices 
          '(color-theme-tango color-theme-standard))
    ;; default-start
    (funcall (lambda (cols)
    	   (let ((color-theme-is-global nil))
    	     (eval 
    	      (append '(if (window-system))
    		      (mapcar (lambda (x) (cons x nil)) 
    			      cols)))))
    	 color-theme-choices)
    ;; test for each additional frame or console
    (require 'cl)
    (fset 'test-win-sys 
          (funcall (lambda (cols)
    		 (lexical-let ((cols cols))
    		   (lambda (frame)
    		     (let ((color-theme-is-global nil))
    		     ;; must be current for local ctheme
    		     (select-frame frame)
    		     ;; test winsystem
    		     (eval 
    		      (append '(if (window-system frame)) 
    			      (mapcar (lambda (x) (cons x nil)) 
    				      cols)))))))
    	       color-theme-choices ))
    ;; hook on after-make-frame-functions
    (add-hook 'after-make-frame-functions 'test-win-sys)


