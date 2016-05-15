(provide 'my-ido)
(require-packages '(flx-ido
		    ido
                    ido-ubiquitous
                    ido-vertical-mode
                    crm-custom
                    recentf))

(setq ido-enable-flex-matching t)
(setq ido-everywhere 1)
(setq ido-ignore-buffers '("\\` " "\\`*"))
(setq ido-max-window-height 10)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(ido-mode t)


(defun my-ido-recentf-open ()
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


(custom-set-faces
 '(ido-subdir ((t (:background "white smoke" :foreground "black")))))
