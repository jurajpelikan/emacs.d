;; ido -- be powerful!
(global-set-key "\C-x\C-f" 'ido-find-file)

;; ecb
(global-set-key "\C-ce"  'ecb-activate)
(global-set-key "\C-cd"  'ecb-toggle-ecb-windows)

;; like alt tab for frames
(global-set-key [C-tab]  'next-multiframe-window)
(global-set-key [C-S-iso-lefttab]  'next-multiframe-window)

;; disable the Insert key
(global-set-key [insert] (lambda () (interactive)))

;; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")

;; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries

;; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything
(define-key cm-map "e" 'show-entry)        ; Show this heading's body
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below

;; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level

(global-set-key "\M-o" cm-map)

;; allternate

(global-set-key [M-left] 'hide-subtree)
(global-set-key [M-right] 'show-subtree)
(global-set-key [M-up] 'outline-backward-same-level)
(global-set-key [M-down] 'outline-forward-same-level)
(global-set-key [M-s-left] 'hide-sublevels)
(global-set-key [M-s-right] 'show-all)
(global-set-key [M-s-up] 'outline-previous-visible-heading)
(global-set-key [M-s-down] 'outline-next-visible-heading)


;; bookmark mode
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(global-set-key (kbd "<C-S-f2>") 'bm-show-all)
