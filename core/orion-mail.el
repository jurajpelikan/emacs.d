;;; Code:

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")




(use-package mu4e
  :init
  (setq mu4e-maildir "~/Dropbox/Mail"
	mu4e-contexts
	`( ,(make-mu4e-context
	     :name "Gmail"
	     :match-func (lambda (msg)
			   (when msg
			     (string-prefix-p
			      "/juraj.pelikan@gmail.com"
			      (mu4e-message-field msg :maildir))))
	     :vars '((mu4e-drafts-folder . "/juraj.pelikan@gmail.com/mail/[Gmail].Drafts")
		     (mu4e-sent-folder . "/juraj.pelikan@gmail.com/mail/[Gmail].Sent Mail")
		     (mu4e-trash-folder . "/juraj.pelikan@gmail.com/mail/[Gmail].Trash"))
	     ))

  ;;	`( ,(make-mu4e-context
  ;;	     :name "Vacuum"
  ;;	     :match-func (lambda (msg)
  ;;			   (when msg (mu4e-message-contact-field-matches
  ;;				      msg :to "juraj.pelikan@vacuumlabs.com")))))
  ;;	`( ,(make-mu4e-context
  ;;	     :name "Kiwi"
  ;;	     :match-func (lambda (msg)
  ;;			   (when msg (mu4e-message-contact-field-matches
  ;;				      msg :to "juraj.pelikan@kiwi.com")))))
  ))

;;juraj.pelikan@vacuumlabs.com/mail

;; (setq mu4e-maildir "~/.mail"
;;       mu4e-contexts
;;     `( ,(make-mu4e-context
;;          :name "home"
;;          :match-func (lambda (msg) (when msg (mu4e-message-contact-field-matches msg :to "personal-email@gmail.com")))
;;          :vars '((mu4e-trash-folder      . "/personal/[Gmail].Trash")))
;;        ,(make-mu4e-context
;;          :name "work"
;;          :match-func (lambda (msg) (when msg (mu4e-message-contact-field-matches msg :to "work-email@gmail.com")))
;;          :vars '((mu4e-trash-folder      . "/work/[Gmail].Bin"))))))

(provide 'orion-mail)
;;; orion-mail.el ends here
