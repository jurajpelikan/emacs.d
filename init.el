;;; Init.el --- orion emacs init
;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))

(load "~/.emacs.d/orion-settings")

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path orion-core-dir)

(use-package orion-autosave)
(use-package orion-global)
(use-package orion-modeline)
(use-package orion-ui)
(use-package orion-hydra)
(use-package orion-navigation)
(use-package orion-prog)
(use-package orion-k8s)

;; (use-package orion-python)
(use-package orion-python-lsp)
;; (use-package orion-python-elpy)
(use-package orion-lisp)
(use-package orion-clojure)
(use-package orion-org-mode)


;; (use-package orion-eshell)
;; (use-package orion-services)
;; (use-package orion-mail)

;;; init.el ends here
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
