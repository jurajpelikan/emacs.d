;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
  (concat "/home/" (user-login-name) "/.emacs.d/emacs_backups/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))


;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/home/" (user-login-name) "/.emacs.d/emacs_backups/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


(setq save-place-file "~/.emacs.d/emacs_backups/saveplace")     ;; keep my ~/ clean
(setq-default save-place t)                                     ;; activate it for all buffers
(require 'saveplace)                                            ;; get the package

