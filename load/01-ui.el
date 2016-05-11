;; UI settings

;; FONTS
(set-default-font "Source Code Pro 15")
(set-frame-font "Source Code Pro 15")
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro 15"))

;; THEME
(load-theme 'base16-oceanicnext-dark t)

;; UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(set-face-attribute
    'fringe
    nil
    :foreground (face-foreground 'default)
    :background (face-background 'default))


;; Show line numbers
(global-linum-mode)
(setq column-number-mode t)


;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)


;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")


;; no bell
(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
