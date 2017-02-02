
;; Cask

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(require 'cask' "~/.emacs.d/.cask/25.1/elpa/cask-20161024.1205/cask.el")
;; (require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PYTHONPATH"))

;; Load config files
(mapc 'load (directory-files "~/.emacs.d/load" t ".*\.el$"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/kiwi/postman.org" "~/org/other.org" "~/org/kiwi/call.org" "~/org/kiwi/pathfinder.org")))
 '(package-selected-packages
   (quote
    (avy guru-mode synonyms ac-anaconda helm-flyspell flyspell-correct-helm yaml-mode dockerfile-mode yafolding python-docstring json-mode flymake-json lua-mode company-anaconda anaconda-mode yasnippet python-mode less-css-mode helm-cider-history clojure-mode-extra-font-locking shackle web-mode virtualenvwrapper use-package smex smartparens prodigy popwin pallet nyan-mode multiple-cursors magit js2-mode ido-ubiquitous idle-highlight-mode htmlize helm-projectile flycheck-cask expand-region exec-path-from-shell drag-stuff cider base16-theme)))
 '(safe-local-variable-values
   (quote
    ((projectile-globally-ignored-files quote
                                        ("/Users/juraj/Code/kiwi/pathfinder/data/*"))
     (projectile-globally-ignored-files quote
                                        ("/Users/juraj/Code/kiwi/pathfinder/data"))
     (projectile-globally-ignored-files quote
                                        ("data/*"))
     (python-shell-extra-pythonpaths "/Users/juraj/Code/kiwi/pathfinder/")
     (python-shell-virtualenv-root . "~/Envs/pathfinder/")
     (python-shell-extra-pythonpaths "~/Code/kiwi/kw-postman/")
     (python-shell-virtualenv-root . "~/Envs/kw-postman")
     (python-shell-extra-pythonpaths "~/Code/kiwi/kw-nats/")
     (python-shell-virtualenv-root . "~/Envs/kw-nats")
     (python-shell-extra-pythonpaths "~/Code/kiwi/changes-mixer/changes_mixer")
     (python-shell-virtualenv-root . "~/Envs/changes-mixer")
     (python-shell-extra-pythonpaths "~/Code/kiwi/oag-processing/oag_processing")
     (python-shell-virtualenv-root . "~/Envs/oag-processing")
     (python-shell-extra-pythonpaths "~/Code/kiwi/oag-app/project")
     (python-shell-virtualenv-root . "~/Envs/oag-app/")
     (python-shell-virtualenv-path . "~/Envs/oag-app/")
     (python-shell-interpreter . "python")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
