;;; Code:

(use-package clojure-mode
  :straight t)

(use-package cider
  :straight t
  :config
  (defun orion-clojure-namespace-refresh ()
    (interactive)
    (cider-interactive-eval
     "(require 'clojure.tools.namespace.repl)
      (clojure.tools.namespace.repl/refresh)"))
  :general
  ("M-r" 'orion-clojure-namespace-refresh)
  )



  (define-key clojure-mode-map (kbd "M-r") 'cider-namespace-refresh)

;; (define-clojure-indent
;;   (defroutes 'defun)
;;   (GET 2)
;;   (POST 2)
;;   (PUT 2)
;;   (DELETE 2)
;;   (HEAD 2)
;;   (ANY 2)
;;   (OPTIONS 2)
;;   (PATCH 2)
;;   (rfn 2)
;;   (let-routes 1)
;;   (context 2))

;; ;; (require 'prelude-lisp)
;; (prelude-require-packages '(clojure-mode cider))

;; (eval-after-load 'clojure-mode
;;   '(progn
;;      (defun prelude-clojure-mode-defaults ()
;;        (subword-mode +1)
;;        (run-hooks 'prelude-lisp-coding-hook))

;;      (setq prelude-clojure-mode-hook 'prelude-clojure-mode-defaults)

;;      (add-hook 'clojure-mode-hook (lambda ()
;;                                     (run-hooks 'prelude-clojure-mode-hook)))))

;; (eval-after-load 'cider
;;   '(progn
;;      (setq nrepl-log-messages t)

;;      (add-hook 'cider-mode-hook 'eldoc-mode)

;;      (defun prelude-cider-repl-mode-defaults ()
;;        (subword-mode +1)
;;        (run-hooks 'prelude-interactive-lisp-coding-hook))

;;      (setq prelude-cider-repl-mode-hook 'prelude-cider-repl-mode-defaults)

;;      (add-hook 'cider-repl-mode-hook (lambda ()
;;                                        (run-hooks 'prelude-cider-repl-mode-hook)))))

(provide 'orion-clojure)
;;; orion-python.el ends here
