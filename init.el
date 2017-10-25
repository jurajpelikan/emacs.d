;;; init.el --- orion emacs init
;; (package-initialize)
;; Code

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)

(load "~/.emacs.d/orion-settings")


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path orion-core-dir)

(use-package orion-ui)
(use-package orion-editor)
(use-package orion-completion)
(use-package orion-navigation)
(use-package orion-python)
(use-package orion-prog)
(use-package orion-editing)
(use-package orion-eshell)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
