;;; Init.el --- orion emacs init
;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")
	("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load "~/.emacs.d/orion-settings")


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path orion-core-dir)

(use-package orion-global)
(use-package orion-ui)
(use-package orion-autosave)
(use-package orion-navigation)
(use-package orion-prog)
(use-package orion-python)
(use-package orion-eshell)
(use-package orion-lisp)
(use-package orion-org-mode)
;; (use-package orion-mail)
(use-package orion-services)
(use-package orion-modeline)
(use-package orion-hydra)

(put 'upcase-region 'disabled nil)
;;; init.el ends here
