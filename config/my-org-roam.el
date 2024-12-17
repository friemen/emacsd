(provide 'my-org-roam)

(use-package org-roam :ensure t
  :custom
  (org-roam-directory "~/Org/roam")
  :init
  (setq org-roam-db-location "~/.emacs.d/localdata/org-roam.db")
  (setq org-roam-node-display-template
        (concat "${todo:10} "
                (propertize "${tags:30} " 'face 'org-tag)
                "${title:40} "
                "${file}"
                "${olp}"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
