(require 'ido)
(ido-mode t)
(ido-everywhere t)


(setq ido-enable-flex-matching t)
(setq ido-enable-last-directory-history nil)

(setq ido-decorations (quote ("{" "}" " | " " | ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]")))



(defun my-ido-hook ()
  "Add my keybindings for ido."
  (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
  (define-key ido-completion-map "\C-n" 'ido-next-match)
  (define-key ido-completion-map "\C-f" 'ido-next-match)
  ;; (define-key ido-completion-map "right" 'ido-next-match)
  (define-key ido-completion-map "\C-p" 'ido-prev-match)
  (define-key ido-completion-map "\C-b" 'ido-prev-match)
  ;; (define-key ido-completion-map "left" 'ido-prev-match)
  (define-key ido-completion-map " "    'ido-exit-minibuffer))



(add-hook 'ido-setup-hook 'my-ido-hook)



