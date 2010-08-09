;; no splash screen, scrollbar and toolbar
(setq inhibit-startup-message t)
(scroll-bar-mode nil)
(tool-bar-mode nil)


;; uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)      ;; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*")   ;; don't muck with special buffers
(setq uniquify-strip-common-suffix-re nil) ;; i want full path

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; display time
(setq display-time-day-and-date nil
      display-time-24hr-format t
      display-time-next-load-average nil)
(display-time )

;; scrolling settings
(setq
  scroll-margin 5
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)

;; browse-url google-chrome
(setq browse-url-generic-program (executable-find "google-chrome")
      browse-url-browser-function 'browse-url-generic)

;; hl line mode
(global-hl-line-mode 1)


;; paren mode
(show-paren-mode t)

;; code hightlighting 
(global-font-lock-mode 1)

;; tab width 4 and only spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


;; gues styles
;; (require 'guess-style)
;; (global-guess-style-info-mode 1)


;; flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)