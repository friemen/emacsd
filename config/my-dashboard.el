(provide 'my-dashboard)

(use-package dashboard :ensure t
  :init
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-items '((projects . 15)
                          (recents  . 10)
                          (bookmarks . 5)
                          ;;(agenda . 5)
                          ;;(registers . 5)
                          ))
  (add-hook 'dashboard-mode-hook (lambda ()
                                   (hl-line-mode)))
  :config
  (dashboard-setup-startup-hook))
