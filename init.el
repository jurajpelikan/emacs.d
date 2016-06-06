;; Cask

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Load config files
(mapc 'load (directory-files "~/.emacs.d/load" t ".*\.el$"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (less-css-mode helm-cider-history clojure-mode-extra-font-locking shackle web-mode virtualenvwrapper use-package smex smartparens prodigy popwin pallet nyan-mode multiple-cursors magit js2-mode ido-ubiquitous idle-highlight-mode htmlize helm-projectile flycheck-cask expand-region exec-path-from-shell elpy drag-stuff cider base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
