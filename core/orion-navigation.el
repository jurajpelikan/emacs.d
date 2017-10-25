;;; Code:

(use-package avy
  :config
  (global-set-key (kbd "C-:") 'avy-goto-word-1)
  (global-set-key (kbd "C-\"") 'avy-goto-char-timer))

(provide 'orion-navigation)
;;; orion-navigation.el ends here
