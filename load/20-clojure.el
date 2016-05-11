;; Clojure

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)


;; go right to the REPL buffer when it's finished connecting
;; (setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
;; (setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))


(add-hook 'cider-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'cider-load-buffer nil 'make-it-local)))
