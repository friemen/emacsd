(provide 'my-diary)

(setq my-temp-ics-file "~/Calendar/event.ics")

(setq my-diaries '(("Private" . ((key . ?p)
                                 (diary-file-path . "~/Calendar/private.diary")
                                 (ics-folder-path . "~/Calendar/private")))
                   ("R3 family" . ((key . ?r)
                                   (diary-file-path . "~/Calendar/r3.diary")
                                   (ics-folder-path . "~/Calendar/r3/calendar")))
                   ("Doctronic" . ((key . ?d)
                                   (diary-file-path . "~/Calendar/dt.diary")
                                   (ics-folder-path . "~/Calendar/dt/personal")))))


(defun my-diary-move-entry (&optional prompt-for-sender)
  (interactive "P")
  (when (string-equal (buffer-name) "diary")
    (my-notmuch-ensure-mail-context prompt-for-sender)
    (setq icalendar-uid-format (concat "%t%c@" mail-host-address))

    (let* ((choices (mapcar (lambda (diary-entry)
                                (let* ((label (car diary-entry))
                                       (key (cdr  (assoc 'key diary-entry))))
                                  (list key label)))
                              my-diaries))
           (choice  (second (read-multiple-choice "Calendar:" choices)))
           (selected-diary (cdr (assoc choice my-diaries)))
           (ics-folder-path (cdr (assoc 'ics-folder-path selected-diary)))
           (diary-file-path (cdr (assoc 'diary-file-path selected-diary))))

      (message "Moving diary entry from %s to %s" (buffer-name) diary-file-path)
      ;; export diary-entry to temp.ics file
      (delete-file my-temp-ics-file)
      (icalendar-export-file diary-file my-temp-ics-file)
      (icalendar-import-file my-temp-ics-file diary-file-path)

      ;; find UID value
      (save-current-buffer
        (set-buffer (find-file my-temp-ics-file))
        (goto-char (point-min))
        (re-search-forward "\nUID:\\(.+\\)\n")
        (setq uid (match-string 1))
        (kill-buffer (current-buffer)))
      ;; copy the event.ics to the selected ics folder
      (copy-file my-temp-ics-file (concat ics-folder-path "/" uid ".ics")))

    ;; remove all content except # lines from diary file
    (save-current-buffer
      (set-buffer (find-file diary-file))
      (goto-char (point-max))
      (while (> (point) (point-min))

        (when (not (string-prefix-p "#"
                                    (buffer-substring  (line-beginning-position) (line-end-position))))
          (delete-region (line-beginning-position) (line-end-position)))
        (forward-line -1))
      (save-buffer))

    (kill-buffer-and-window)
    (calendar)

    ;; TODO do this for each event separately?
    ;; ask user and send email, if this is an invitation
    (when (y-or-n-p "Send event as invitation?")
      (window-number-select 0)
      (let ((notmuch-mua-compose-in* notmuch-mua-compose-in))
        (setq notmuch-mua-compose-in 'current-window)
        (my-notmuch-new-mail prompt-for-sender)
        (setq notmuch-mua-compose-in notmuch-mua-compose-in*))
      (mml-attach-file my-temp-ics-file))
    )

  )


(defun my-diary-font-locking ()
  (font-lock-add-keywords nil
                          '(("\\([0-9][0-9]:[0-9][0-9]\\)" 0 'font-lock-keyword-face))))


(use-package calendar
  :init
  (require 'calendar)
  (require 'diary-lib)
  (require 'my-notmuch)
  :bind
  (("C-x C-c" . 'calendar)
   :map diary-mode-map
        ("C-c C-c" . 'my-diary-move-entry))

  :config
  (add-hook 'diary-list-entries-hook 'diary-sort-entries t)
  (add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
  (add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)
  (setq calendar-week-start-day 1) ;; monday starts the week
  (setq calendar-view-diary-initially-flag t
        diary-number-of-entries 7
        diary-display-function #'diary-fancy-display)
  (add-hook 'calendar-today-visible-hook 'calendar-mark-today)
  (add-hook 'diary-fancy-display-mode-hook 'my-diary-font-locking)
  (setq diary-file "~/Calendar/diary"
        ;; european
        diary-date-forms diary-european-date-forms
        calendar-date-display-form calendar-european-date-display-form
        calendar-date-style 'european
        ;; iso -- doesn't work when exporting diary region to ics file
        ;; diary-date-forms    diary-iso-date-forms
        ;; calendar-date-display-form calendar-iso-date-display-form
        ;; calendar-date-style 'iso
      )
  )
