(provide 'my-mode-line)

(use-package spaceline :ensure t)

(use-package spaceline-config :ensure spaceline
  :config
  (setq powerline-height 26)
  (setq powerline-default-separator nil)
  (spaceline-toggle-buffer-encoding-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-projectile-root-on)
  (spaceline-emacs-theme 'projectile-root))
