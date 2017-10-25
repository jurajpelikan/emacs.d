;;; Code:

(use-package desktop
  :config
  (setq desktop-save t
	desktop-path (list orion-save-dir)
	desktop-dirname orion-save-dir)
  :init
  (desktop-save-mode t))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

(set-frame-font orion-font)
(add-to-list 'default-frame-alist
	     `(font . ,orion-font))

(when orion-theme
  (load-theme orion-theme t))

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme nil)
  (add-hook 'after-init-hook #'sml/setup))


;; (use-package beacon
;;   :init
;;   (beacon-mode +1))

(use-package which-key
  :init
  (which-key-mode +1))

(menu-bar-mode +1)
(scroll-bar-mode -1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(set-face-attribute
 'fringe
 nil
 :foreground (face-foreground 'default)
 :background (face-background 'default))

(global-linum-mode)

(provide 'orion-ui)
;;; orion-ui.el ends here
