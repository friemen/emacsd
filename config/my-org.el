(provide 'my-org)

(defun my-org-xdg-open-at-point ()
  (when (org-in-regexp org-link-any-re)
    (let* ((link (org-element-lineage (org-element-context) '(link) t))
           (type (org-element-property :type link))
           (path (org-element-property :path link))
           (url (concat type ":" path))
           (extension (file-name-extension path)))
      (when (and (string= type "file")
                 (string-match-p my-xdg-open-file-extension-re (concat "." extension)))
        (message "xdg-open: %s %s %s" extension type path)
        (shell-command (concat "xdg-open " path))
        t))))


(use-package org
  :bind
  (("C-x C-a" . org-agenda)
   ("C-x C-l" . org-store-link)
   ("C-x C-q" . org-capture)
   :map org-mode-map
   ("C-<tab>" . other-window)
   ("C-," . ace-jump-mode)
   ("C-t" . org-set-tags-command)
   ;;("S-<right>" . nil)
   ;;("S-<down>" . nil)
   )
  :config
  (setq org-startup-with-inline-images t)
  (setq org-startup-folded t)
  (setq org-agenda-include-diary t)
  (setq org-hide-leading-stars t)
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

  ;; try to register file extension pattern with xdg open for org mode
  (add-hook 'org-open-at-point-functions
            #'my-org-xdg-open-at-point))
