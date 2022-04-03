(provide 'my-org)

(use-package org
  :bind
  (:map org-mode-map
        ("C-<tab>" . other-window)
        ("C-," . ace-jump-mode)
        ;;("S-<right>" . nil)
        ;;("S-<down>" . nil)
        )
  :config
  (setq org-support-shift-select t)
  (setq org-agenda-files '("~/Documents/org"))
  (setq org-startup-with-inline-images t)
  (setq org-startup-folded t)
)
