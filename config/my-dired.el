(provide 'my-dired)
(require-packages '(dired+
		    ido))

(toggle-diredp-find-file-reuse-dir 1)
(diredp-make-find-file-keys-reuse-dirs)
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")
(add-hook 'dired-load-hook
               (lambda ()
                 (load "dired-x")
                 ;; Set dired-x global variables here.  For example:
                 ))
(add-hook 'dired-mode-hook
               (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 (dired-omit-mode 1)
		 (hl-line-mode)))

(custom-set-faces
 '(diredp-dir-name
   ((t :background "white smoke" :inverse-video nil))))
