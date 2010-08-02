;; ido -- be powerful!
(global-set-key "\C-x\C-f" 'ido-find-file)

;; ecb
(global-set-key "\C-ce"  'ecb-activate)
(global-set-key "\C-cd"  'ecb-toggle-ecb-windows)

;; like alt tab for frames
(global-set-key [C-tab]  'next-multiframe-window)
(global-set-key [C-S-iso-lefttab]  'next-multiframe-window)

;; Uncomment this to disable the Insert key, which I find annoying
(global-set-key [insert] (lambda () (interactive)))


