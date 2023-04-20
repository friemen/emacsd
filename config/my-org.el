(provide 'my-org)

(use-package org
  :bind
  (("C-x C-a" . org-agenda)
   :map org-mode-map
   ("C-<tab>" . other-window)
   ("C-," . ace-jump-mode)
   ("C-t" . org-set-tags-command)
   ;;("S-<right>" . nil)
   ;;("S-<down>" . nil)
   )
  :config
  (setq org-support-shift-select t)
  (setq org-directory "~/Org")
  (setq org-todo-keywords '((sequence "TODO" "NEXT" "STARTED" "DONE")))
  (setq org-agenda-files '("~/Org/falko.org"
                           "~/Org/dt/bfn-rl2020.org"
                           "~/Org/dt/idw-qmhb.org"
                           ;;"~/Org/dt/ottoschmidt.org"
                           "~/Org/dt/dt-kwaestio.org"
                           "~/Org/dt/dt-ms.org"
                           ))
  (setq org-agenda-custom-commands
        '(("p" "Private"
           ((agenda "")
            (alltodo))
           ((org-agenda-files '("~/Org/private"))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)))
          ("w" "Work"
           ((agenda "")
            (alltodo))
           ((org-agenda-files '("~/Org/dt"))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)))))
  (setq org-startup-with-inline-images t)
  (setq org-startup-folded t)
  (setq org-agenda-include-diary t)
  (setq org-hide-leading-stars t))
