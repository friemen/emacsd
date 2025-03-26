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

(defvar my-ticket-url-prefix
  "https://doctronic.atlassian.net/browse/")

(defun my-org-browse-ticket-at-point ()
  (let* ((r (org-in-regexp "[A-Z]\\{2,\\}-[0-9]+")))
    (when r
      (let* ((beg (car r))
             (end (cdr r))
             (ticket-nr (buffer-substring beg end))
             (beg 0)
             (end (length ticket-nr))
             (_ (set-text-properties beg end nil ticket-nr))
             (url (concat my-ticket-url-prefix ticket-nr)))
        (message "Opening ticket in browser %s" url)
        (browse-url url))
      t)))

(defun my-org-insert-jira-ticket-link (&optional ticket-nr)
    (interactive "MTicket: ")
    (let* ((ticket-nr
            (upcase ticket-nr))

           (jira-issue-link
            (concat my-ticket-url-prefix ticket-nr)))

      (org-insert-link nil jira-issue-link ticket-nr)))

(defun my-org-reset-checklist-when-done ()
  (when (and (org-get-repeat)
             (member org-state org-done-keywords))
    (org-reset-checkbox-state-subtree)))

(use-package org
  :bind
  (("C-x C-a" . org-agenda)
   ("C-x C-l" . org-store-link)
   ("C-x C-q" . org-capture)
   :map org-mode-map
   ("C-<tab>" . other-window)
   ("C-," . ace-jump-mode)
   ("C-t" . org-set-tags-command)
   ("<f5>" . org-tree-slide-mode)
   ("S-M-<right>" . org-shiftright)
   ("S-M-<left>" . org-shiftleft)
   ("S-<right>" . nil)
   ("S-<left>" . nil)
   ("S-<up>" . nil)
   ("S-<down>" . nil)
   ("C-c b" . org-cycle-list-bullet)
   :map org-agenda-mode-map
   ("C-c C-o" . org-open-at-point))
  :config
  (require 'org-agenda)
  (setq org-directory "~/Org")
  (setq org-ellipsis " ⏷") ; ⤵↴
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width '(800))
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)
  (setq org-support-shift-select t)
  (setq org-return-follows-link t)
  (setq org-log-into-drawer "LOGBOOK")
  (setq org-tags-column 80)
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "DONE(d!)")))
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
                                      (todo   todo-state-down priority-down category-keep)
                                      (tags   priority-down category-keep)
                                      (search category-keep)))
  (setq org-agenda-custom-commands
        '(("p" "Private"
           ;; multi block view
           ((agenda)
            (todo "STARTED"
                  ;; settings applying to this block
                  ((org-super-agenda-groups nil))))
           ;; settings applying to all blocks
           ((org-agenda-files (list (concat org-directory "/inbox--todos.org")
                                    (concat org-directory "/private")))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)
            (org-agenda-format-date "                                                                          \n%A %d.%B")
            (org-super-agenda-groups
             '((:time-grid t)
               (:name "Things to do"
                      :todo ("TODO" "NEXT" "STARTED"))))))
          ("w" "Work"
           ((agenda)
            (todo "STARTED"
                  ((org-super-agenda-groups nil))))
           ((org-agenda-files (list (concat org-directory "/inbox--todos.org")
                                    (concat org-directory "/dt")))
            (org-agenda-start-on-weekday nil) ;; start on current day
            (org-agenda-span 7)
            (org-agenda-format-date "                                                                          \n%A %d.%B")
            (org-super-agenda-groups
             '((:time-grid t)
               (:name "Things to do"
                      :todo ("TODO" "NEXT" "STARTED"))))))))

  ;; auto save org buffers
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)

  ;; register file extension pattern with xdg open for org mode
  (add-hook 'org-open-at-point-functions #'my-org-xdg-open-at-point)
  ;; do browse-url on text that looks like a ticket nr
  (add-hook 'org-open-at-point-functions #'my-org-browse-ticket-at-point)

  ;; look
  (font-lock-add-keywords 'org-mode
                          '(
                            ;; ("^\\(**\\) "
                            ;;  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "❇ "))))
                            ;; ("^\\(*\\) "
                            ;;  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "✣ "))))
                            ("^\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; auto reset checklist when DONE state is reached
  (add-hook 'org-after-todo-state-change-hook #'my-org-reset-checklist-when-done))

(use-package org-superstar :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-super-agenda :ensure t
  :init
  (org-super-agenda-mode t))

;; org-super-agenda-groups Testing
;; (let ((org-agenda-files (list (concat org-directory "/inbox--todos.org")
;;                               (concat org-directory "/dt")))
;;       (org-super-agenda-groups
;;              '((:auto-category t))))
;;   (org-agenda nil "t"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-roam

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-anki

(use-package org-anki :ensure t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-tree-slide

(use-package org-tree-slide :ensure t
  :bind
  (:map org-tree-slide-mode-map
        ("<next>" . org-tree-slide-move-next-tree)
        ("<prior>" . org-tree-slide-move-previous-tree))
  :config
  (setq org-tree-slide-cursor-init t)
  (add-hook 'org-tree-slide-play-hook
            (lambda ()
              (set-face-attribute 'org-meta-line nil
			          :foreground (face-attribute 'default :background))
              (set-cursor-color "White")
              (text-scale-adjust +3)
              (set-window-margins nil 40)
              (hide-mode-line-mode 1)))
  (add-hook 'org-tree-slide-stop-hook
            (lambda ()
              (set-face-attribute 'org-meta-line nil :foreground nil)
              (hide-mode-line-mode 0)
              (text-scale-adjust 0)
              (set-window-margins nil 0)
              (set-cursor-color "Orange Red"))))
