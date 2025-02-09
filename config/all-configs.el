(provide 'all-configs)

(require 'my-global-settings)

(use-package diminish :ensure t)
(use-package hydra :ensure t)
(use-package use-package-hydra :ensure t)
(use-package hide-mode-line :ensure t)
(use-package popup :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package window-number :ensure t
  :config
  (window-number-meta-mode) ;; use meta key (i.e. Alt-1, Alt-2, ...) to switch between windows
  )
(use-package expand-region :ensure t
  :bind
  (("C-SPC" . er/expand-region)))
(use-package browse-kill-ring :ensure t
  :bind
  (("<C-insert>" . browse-kill-ring)))
(use-package impatient-mode :ensure t)
(use-package restclient :ensure t)
(use-package ace-jump-mode :ensure t
  :bind
  (("C-," . ace-jump-mode)))

(require 'my-clojure)
(require 'my-company)
(require 'my-dashboard)
(require 'my-diary)
(require 'my-dired)
(require 'my-elisp)
(require 'my-file-utils)
(require 'my-hideshow)
(require 'my-highlight-symbol)
(require 'my-ibuffer)
(require 'my-ivy-swiper-counsel)
(require 'my-jump-mark-utils)
(require 'my-magit)
(require 'my-mode-line)
(require 'my-markdown)
(require 'my-multiple-cursors)
(require 'my-notmuch)
(require 'my-nxml)
(require 'my-org)
(require 'my-paredit)
(require 'my-projectile)
(require 'my-python)
(require 'my-treemacs)
(require 'my-themes)
(require 'my-undotree)
(require 'my-visual-basic)
(require 'my-web-css-sass)
(require 'my-window-control)
(require 'my-yasnippet)

(require 'my-global-keybindings)
