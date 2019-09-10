(provide 'my-dashboard)

(require-packages '(dashboard))

(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-banner-logo-title "Welcome to Emacs!")
(setq dashboard-items '((projects . 15)
			(recents  . 10)
                        (bookmarks . 5)
                        ;;(agenda . 5)
                        ;;(registers . 5)
			))
