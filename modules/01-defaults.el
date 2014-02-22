
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(ido-max-window-height 10)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(menu-bar-mode t)
 '(org-startup-with-inline-images t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))      


(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(cider-eval-sexp-fu-flash ((t (:background "rosy brown" :foreground "white" :weight bold)))))

(set-cursor-color "#ffa000")

