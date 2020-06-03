;;; Code:


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

(use-package color-theme-sanityinc-tomorrow
  ;; :straight (:host github :repo "purcell/color-theme-sanityinc-tomorrow")
  :straight t
  :config
  (color-theme-sanityinc-tomorrow-eighties))

;; (use-package dimmer
;;   :straight t
;;   :config
;;   (dimmer-mode))

;; ;; (when orion-theme
;;   (load-theme orion-theme t))


;; (use-package smart-mode-line
;;   :straight t
;;   :init
;;   (progn
;;     (setq sml/no-confirm-load-theme t)
;;     (sml/setup)))

(menu-bar-mode +1)
(scroll-bar-mode -1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(defvar orion-ui/initialized nil)

(defun orion-ui/ui-initialize ()
  "Setup orion ui.

FRAME argument is required for after-make-frame hook."
  (if (not orion-ui/initialized)
      (progn
	(message "ui init")
	(set-face-attribute
	 'fringe
	 nil
	 :foreground (face-foreground 'default)
	 :background (face-background 'default))
	(setq orion-ui/initialized t))))


(add-hook 'focus-in-hook #'orion-ui/ui-initialize)

(provide 'orion-ui)
;;; orion-ui.el ends here
