;;; Code:

(defvar orion-dir (file-name-directory load-file-name))
(defvar orion-core-dir (expand-file-name "core" orion-dir))
(defvar orion-save-dir (expand-file-name "save-dir" orion-dir))

;; (defvar orion-theme 'base16-oceanicnext-dark)
;; (defvar orion-theme 'solarized-dark)
(defvar orion-font "Source Code Pro Light 14")

(provide 'orion-settings)
