(provide 'my-mode-line)

(use-package smart-mode-line :ensure t

  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  (setq sml/mode-width 'full)
  (sml/apply-theme 'automatic))
