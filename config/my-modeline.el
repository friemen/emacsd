(provide 'my-modeline)
(require-package 'smart-mode-line)

(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/mode-width 'full)
(sml/apply-theme 'automatic)

(custom-set-faces
 '(mode-line-inactive
   ((t :foreground "grey20" :background "Gainsboro" :inverse-video nil)))
 '(mode-line
   ((t :foreground "black" :background "RosyBrown2" :inverse-video nil))))
