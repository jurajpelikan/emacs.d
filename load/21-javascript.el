;; Javascript

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

;; switch case indetantation
(setq js-switch-indent-offset 4)

;; 4 spaces html identation
(setq sgml-basic-offset 4)


;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")
(setq flycheck-javascript-eslint-executable "/usr/local/bin/eslint")
