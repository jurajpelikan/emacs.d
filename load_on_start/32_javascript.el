(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-bounce-indent-p t)

;; (require 'flymake-jslint)
;; (add-hook 'javascript-mode-hook
;; 		  (lambda () (flymake-mode t)))