(provide 'my-paredit)

(use-package smartparens :ensure t
  :diminish

  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

(use-package paxedit :ensure t) ;; needed also for my-lisp-utils

(use-package paredit :ensure t
  :diminish

  :bind
  (:map paredit-mode-map
        ("C-1" . paredit-open-round)
        ("C-2" . paredit-open-bracket)
        ("C-3" . paredit-open-curly)
        ("C-d" . my-delete-whitespace-except-one)
        ("C-f" . paredit-forward)
        ("C-b" . paredit-backward)
        ("C-M-f" . paredit-forward-down)
        ("C-M-b" . paredit-backward-up)
        ("M-<right>" . paredit-forward)
        ("M-<left>" . paredit-backward)
        ("M-<down>" . paredit-forward-down)
        ("M-<up>" . paredit-backward-up)
        ;;("<backspace>" . paredit-backward-delete-key)
        ("<delete>" . my-delete-region-or-char))

  :config
  (require 'my-lisp-utils)
  )
