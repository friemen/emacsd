(provide 'my-mode-line)

(use-package spaceline :ensure t)

(use-package spaceline-config :ensure spaceline
  :config
  (setq powerline-height 26)
  (setq powerline-default-separator 'rounded)
  (spaceline-toggle-projectile-root-on)
  (spaceline-emacs-theme 'projectile-root))
