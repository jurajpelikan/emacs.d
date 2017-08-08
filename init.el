;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

