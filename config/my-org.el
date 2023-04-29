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
  (setq org-directory "~/Org")
  (setq org-ellipsis "⤵")
  (setq org-startup-with-inline-images t)
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)
  (setq org-support-shift-select t)
  (setq org-tags-column 80)
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "DONE(d)")))
  (setq org-todo-keyword-faces '(("STARTED" . "#d08770") ("WAITING" . "#b48ead")))

  ;; capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Org/inbox--todos.org" "Tasks to be refiled")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/Org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))

  ;;refile
  (setq org-refile-targets
        `(
          (,(directory-files-recursively (concat org-directory "/private") "^[a-zA-Z0-9-_+]*--todos.org$")
           :maxlevel . 1)
          (,(directory-files-recursively (concat org-directory "/dt") "^[a-zA-Z0-9-_+]*--todos.org$")
           :maxlevel . 1)

          ))

  ;; agenda
  (setq org-agenda-include-diary t)
  (setq org-agenda-files (list (concat org-directory "/inbox--todos.org")
                               (concat org-directory "/dt")
                               (concat org-directory "/private")))
  (setq org-agenda-file-regexp "\\`[^.].*--todos\\.org\\'")
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-agenda-sorting-strategy '((agenda habit-down time-up priority-down category-keep)
                                      (todo   todo-state-up priority-down category-keep)
                                      (tags   priority-down category-keep)
                                      (search category-keep)))
  (setq org-agenda-custom-commands
        '(("p" "Private"
           ((agenda "")
            (alltodo))
           ((org-agenda-files (list (concat org-directory "/inbox--todos.org")
                                    (concat org-directory "/private")))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)))
          ("w" "Work"
           ((agenda "")
            (alltodo))
           ((org-agenda-files (list (concat org-directory "/inbox--todos.org")
                                    (concat org-directory "/dt")))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)))))

  ;; auto save org buffers
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)

  ;; try to register file extension pattern with xdg open for org mode
  (add-hook 'org-open-at-point-functions
            #'my-org-xdg-open-at-point)

  ;; look
  (font-lock-add-keywords 'org-mode
                          '(
                            ;; ("^\\(**\\) "
                            ;;  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "❇ "))))
                            ;; ("^\\(*\\) "
                            ;;  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "✣ "))))
                            ("^\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
