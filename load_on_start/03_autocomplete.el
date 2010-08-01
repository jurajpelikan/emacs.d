;; pabbrev mode
(require 'pabbrev)
(defadvice pabbrev-expand-maybe 
  (around pabbrev-expand-maybe-when-not-after-whitespace activate)
  "prevent expansion when only whitespace between point and beginning of line"
  (if (save-match-data
        (save-excursion
          (let ((p (point)))
            (string-match "^\\s-*$" (buffer-substring-no-properties 
									 (progn (beginning-of-line) (point)) p)))))
      (let ((last-command 
			 (if (eq last-command this-command) 
				 (pabbrev-get-previous-binding) last-command))
            (this-command (pabbrev-get-previous-binding)))
        (pabbrev-call-previous-tab-binding))
    ad-do-it))
