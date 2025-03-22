(provide 'my-notmuch)

(setq user-full-name "Falko Riemenschneider")
(setq user-mail-address "unknown") ;; WATCHOUT nil would break Org html export, use `unknown' to ensure that user needs to select a mail context
(setq send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
(setq mail-specify-envelope-from t)
(setq message-sendmail-envelope-from 'header)
(setq mail-envelope-from 'header)


(defun my-notmuch-context-doctronic ()
  (interactive)
  ;;(setq message-sendmail-extra-arguments '("-a" "riemenschneider@doctronic.de"))
  (setq user-mail-address "riemenschneider@doctronic.de")
  (setq message-signature-file "~/Mail/signature-dt.txt")
  (setq mail-host-address "doctronic.de")
  (setq notmuch-draft-folder "riemenschneider@doctronic.de/Drafts")
  (message "Mail context is doctronic.de"))

(defun my-notmuch-context-arcor ()
  (interactive)
  (setq user-mail-address "falko.riemenschneider@arcor.de")
  (setq message-signature-file "~/Mail/signature-private.txt")
  (setq mail-host-address "arcor.de")
  (setq notmuch-draft-folder "falko.riemenschneider@arcor.de/Drafts")
  (message "Mail context is arcor.de"))

(defun my-notmuch-context-falkoriemenschneider ()
  (interactive)
  (setq user-mail-address "admin@falkoriemenschneider.de")
  (setq message-signature-file "~/Mail/signature-falkoriemenschneider.txt")
  (setq mail-host-address "falkoriemenschneider.de")
  (setq notmuch-draft-folder "admin@falkoriemenschneider.de/Drafts")
  (message "Mail context is falkoriemenschneider.de"))

(defun my-notmuch-context-by-address (mail-address)
  (cond ((string= mail-address "riemenschneider@doctronic.de")
         (my-notmuch-context-doctronic))
        ((string= mail-address "falko.riemenschneider@arcor.de")
         (my-notmuch-context-arcor))
        ((string= mail-address "admin@falkoriemenschneider.de")
         (my-notmuch-context-falkoriemenschneider))
        (t
         (message (concat  "Unable to set mail context for address: " mail-address)))))

(setq notmuch-fcc-dirs
      '(("riemenschneider@doctronic.de" . "riemenschneider@doctronic.de/Sent -unread +sent")
        ("falko.riemenschneider@arcor.de" . "falko.riemenschneider@arcor.de/Sent -unread +sent")
        ("admin@falkoriemenschneider.de" . "admin@falkoriemenschneider.de/Sent -unread +sent")))

(defun my-notmuch-ensure-mail-context (prompt-for-sender)
  (if (or (string-equal user-mail-address "unknown")
          prompt-for-sender
          notmuch-always-prompt-for-sender)
      (let* ((from (notmuch-mua-prompt-for-sender))
             (mail-address (car (mail-header-parse-address from)))
             (other-headers (list (cons 'From from))))
        (message (concat "Selecting mail context for: " mail-address))
        (my-notmuch-context-by-address mail-address))
    (my-notmuch-context-by-address user-mail-address)))

;; replace notmuch-mua-new-mail
(defun my-notmuch-new-mail (&optional prompt-for-sender)
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (notmuch-mua-mail nil nil
                      (list (list 'From (concat user-full-name " <" user-mail-address ">")))
                      nil (notmuch-mua-get-switch-function))))

;; replaces notmuch-search-reply-to-thread-sender
(defun my-notmuch-search-reply-sender (&optional prompt-for-sender)
  "Reply to sender"
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (let ((select-active-regions nil))
      (notmuch-mua-reply (notmuch-search-find-thread-id)
                         (concat user-full-name " <" user-mail-address ">")
                         nil nil)
      (deactivate-mark))))

;; replaces notmuch-search-reply-to-thread
(defun my-notmuch-search-reply-all (&optional prompt-for-sender)
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (let ((select-active-regions nil))
      (notmuch-mua-reply (notmuch-search-find-thread-id)
                         (concat user-full-name " <" user-mail-address ">")
                         t nil)
      (deactivate-mark))))

;; replaces notmuch-show-reply-sender
(defun my-notmuch-show-reply-sender (&optional prompt-for-sender)
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (let ((select-active-regions nil))
      (notmuch-mua-reply (notmuch-show-get-message-id)
                         (concat user-full-name " <" user-mail-address ">")
                         nil (notmuch-show-get-prop :duplicate))
      (deactivate-mark))))

;; replaces notmuch-show-reply
(defun my-notmuch-show-reply-all (&optional prompt-for-sender)
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (let ((select-active-regions nil))
      (notmuch-mua-reply (notmuch-show-get-message-id)
                         (concat user-full-name " <" user-mail-address ">")
                         t (notmuch-show-get-prop :duplicate))
      (deactivate-mark))))

(defun my-current-sender (orig-fun &rest args)
  (concat user-full-name " <" user-mail-address ">"))

;; replaces notmuch-show-forward-message
(defun my-notmuch-show-forward-message (&optional prompt-for-sender)
  (interactive "P")
  (my-notmuch-ensure-mail-context prompt-for-sender)
  (when user-mail-address
    (advice-add 'notmuch-mua-prompt-for-sender :around #'my-current-sender)
    (notmuch-mua-new-forward-messages (list (notmuch-show-get-message-id)) t)
    (advice-remove 'notmuch-mua-prompt-for-sender #'my-current-sender)))

(defun my-notmuch-replace-with-template ()
  (interactive)
  (let* ((template-dir (concat (notmuch-database-path) "/templates"))
         (mail-file (read-file-name "Mail template:" template-dir)))
    (when (not (string= mail-file ""))
      (erase-buffer)
      (insert-file-contents mail-file))))

(defun my-notmuch-goto-next-url ()
  (interactive)
  (search-forward "http"))

(defun my-notmuch-search-delete-messages (&optional beg end)
  (interactive)
  (notmuch-search-tag (list "+deleted") beg end))

(defun my-notmuch-show-delete-message ()
  (interactive)
  (notmuch-show-tag (list "+deleted")))


(defface my-notmuch-tag-todo
  '((t :foreground "#d08770"))
  "Todo tag")

(defun my-notmuch-font-locking ()
  (font-lock-add-keywords nil
                          '(("\\<unread\\>" 0 'notmuch-tag-unread)
                            ("\\<flagged\\>" 0 'notmuch-tag-flagged)
                            ("\\<todo\\>" 0 'my-notmuch-tag-todo))
                          'set))

;; Taken from https://gist.github.com/fedxa/fac592424473f1b70ea489cc64e08911
(defun my-org-notmuch-open (id)
  "Visit the notmuch message or thread with id ID."
  (notmuch-show id))

(defun my-org-notmuch-store-link ()
  "Store a link to a notmuch mail message."
  (cl-case major-mode
    (notmuch-show-mode
     ;; Store link to the current message
     (let* ((id (notmuch-show-get-message-id))
	    (link (concat "notmuch:" id))
	    (description (format "Mail: %s" (notmuch-show-get-subject))))
       (org-store-link-props
	:type "notmuch"
	:link link
	:description description)))
    (notmuch-search-mode
     ;; Store link to the thread on the current line
     (let* ((id (notmuch-search-find-thread-id))

  (link (concat "notmuch:" id))
	    (description (format "Mail: %s" (notmuch-search-find-subject))))
       (org-store-link-props
	:type "notmuch"
	:link link
	:description description)))))

(defun my-notmuch-hello ()
  (interactive)
  (notmuch)
  (widget-forward 4))

(use-package notmuch :ensure t
  :init
  (require 'notmuch-mua)
  (require 'org)
  (require 'org-element)
  :bind
  (("C-x m" . hydra-notmuch-context/body)
   ("C-x C-m" . my-notmuch-new-mail)
   ("C-x C-n" . my-notmuch-hello)
   :map notmuch-hello-mode-map
   ("m" . my-notmuch-new-mail)
   :map notmuch-search-mode-map
   ("r" . my-notmuch-search-reply-sender)
   ("R" . my-notmuch-search-reply-all)
   ("m" . my-notmuch-new-mail)
   ("d" . my-notmuch-search-delete-messages)
   :map notmuch-show-mode-map
   ("C-<tab>" . other-window)
   ("C-c C-l" . my-notmuch-goto-next-url)
   ("C-c C-o" . browse-url-at-point)
   ("r" . my-notmuch-show-reply-sender)
   ("R" . my-notmuch-show-reply-all)
   ("f" . my-notmuch-show-forward-message)
   ("m" . my-notmuch-new-mail)
   ("d" . my-notmuch-show-delete-message)
   :map notmuch-message-mode-map
   ("C-c t" . my-notmuch-replace-with-template))
  :config
  ;; hello screen
  (fullframe notmuch notmuch-bury-or-kill-this-buffer)
  (setq notmuch-sort-saved-searches nil)
  (setq notmuch-show-logo nil)
  (setq notmuch-hello-thousands-separator ".")
  (setq notmuch-saved-searches
        '((:name "unread/attention"
                 :query "query:attention"
                 :sort-order "newest-first")
          (:name "unread" :query "tag:unread" :key "u")
          (:name "sent last 7d" :query "tag:sent and date:7days..now" :key "s")
          (:name "todo" :query "tag:todo" :key "t")
          (:name "flagged" :query "tag:flagged" :key "f")
          (:name "drafts" :query "tag:draft" :key "d")
          (:name "arcor/unread"
                 :query "path:\"falko.riemenschneider@arcor.de/**\" tag:unread"
                 :sort-order "newest-first")
          (:name "arcor/inbox"
                 :query "path:\"falko.riemenschneider@arcor.de/**\" tag:inbox"
                 :sort-order "newest-first")
          (:name "arcor/sent"
                 :query "folder:falko.riemenschneider@arcor.de/Sent and tag:sent"
                 :sort-order "newest-first")
          (:name "dt/unread"
                 :query "path:\"riemenschneider@doctronic.de/**\" and tag:unread and -tag:rl2020 and -tag:ottoschmidt and -tag:doctronic-ms and -tag:doctronic-kwaestio"
                 :sort-order "newest-first")
          (:name "dt/inbox"
                 :query "path:\"riemenschneider@doctronic.de/**\" tag:inbox"
                 :sort-order "newest-first")
          (:name "dt/sent"
                 :query "folder:riemenschneider@doctronic.de/Sent and tag:sent"
                 :sort-order "newest-first")
          (:name "rl2020/unread"
                 :query "query:rl2020 tag:unread"
                 :sort-order "newest-first")
          (:name "ottoschmidt/unread"
                 :query "query:ottoschmidt tag:unread"
                 :sort-order "newest-first")
          (:name "idw/unread"
                 :query "query:idw tag:unread"
                 :sort-order "newest-first")
          (:name "doctronic-ms/unread"
                 :query "query:doctronic-ms tag:unread"
                 :sort-order "newest-first")
          (:name "doctronic-kwaestio/unread"
                 :query "query:doctronic-kwaestio tag:unread"
                 :sort-order "newest-first")
          (:name "trash" :query "tag:deleted")
          (:name "all mail" :query "*" :key "a")))
  (setq notmuch-search-result-format
        '(("date" . "%12s ")
          ("count" . "%-7s ")
          ("authors" . "%-30s ")
          ("subject" . "%s ")
          ("tags" . "(%s)")))
  (add-hook 'notmuch-hello-refresh-hook 'my-notmuch-font-locking)

  ;; search results buffer
  (setq notmuch-search-oldest-first nil) ;; also set in custom.el

  ;; view single thread/mail in buffer
  (setq notmuch-message-headers '("Date" "To" "Cc" "Subject"))
  (setq message-kill-buffer-on-exit t)
  (setq notmuch-show-part-button-default-action 'notmuch-show-view-part)
  (setq notmuch-show-indent-messages-width 2)
  (setq notmuch-wash-signature-lines-max 25)

  ;; message composition
  (setq notmuch-always-prompt-for-sender nil)
  (setq notmuch-mua-compose-in 'new-window)
  (add-hook 'message-send-hook (lambda ()
			         (let ((from (car (mail-header-parse-address
                                                   (message-fetch-field "from")))))
                                   (setq message-sendmail-extra-arguments (list "-a" from)))))

  ;; org - notmuch integration with respect to store link
  (org-link-set-parameters "notmuch"
			   :follow 'my-org-notmuch-open
			   :store 'my-org-notmuch-store-link)

  :hydra
  (hydra-notmuch-context (:hint nil :exit t) "
Select mail context:
[_d_] doctronic.de
[_a_] arcor.de
[_f_] admin@falkoriemenschneider.de"
                         ("d" my-notmuch-context-doctronic)
                         ("a" my-notmuch-context-arcor)
                         ("f" my-notmuch-context-falkoriemenschneider)))
