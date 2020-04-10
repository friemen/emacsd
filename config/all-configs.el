(provide 'all-configs)

(require 'my-global-settings)

(use-package diminish :ensure t)
(use-package hydra :ensure t)
(use-package use-package-hydra :ensure t)
(use-package popup :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package expand-region :ensure t
  :bind
  (("C-SPC" . er/expand-region)))
(use-package browse-kill-ring :ensure t
  :bind
  (("<C-insert>" . browse-kill-ring)))
(use-package impatient-mode :ensure t)
(use-package restclient :ensure t)
(use-package ibuffer
  :bind
  (("C-x C-b" . ibuffer))
  :config
  (add-hook 'ibuffer-mode-hook (lambda () (hl-line-mode t))))
(use-package ace-jump-mode :ensure t
  :bind
  (("C-," . ace-jump-mode)))

(require 'my-clojure)
(require 'my-company)
(require 'my-dashboard)
(require 'my-dired)
(require 'my-elisp)
(require 'my-file-utils)
(require 'my-hideshow)
(require 'my-highlight-symbol)
(require 'my-ivy-swiper-counsel)
(require 'my-magit)
(require 'my-mode-line)
(require 'my-markdown)
(require 'my-multiple-cursors)
(require 'my-nxml)
(require 'my-org)
(require 'my-paredit)
(require 'my-projectile)
(require 'my-treemacs)
(require 'my-themes)
(require 'my-web-css-sass)
(require 'my-window-control)

(require 'my-global-keybindings)
