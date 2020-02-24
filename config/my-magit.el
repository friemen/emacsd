(provide 'my-magit)

(use-package fullframe :ensure t)

(use-package magit :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-x l" . magit-log-buffer-file)
   :map magit-mode-map
   ("C-<tab>" . other-window)
   ("<tab>" . magit-section-toggle)
   ("C-w" . magit-mode-bury-buffer)
   )

  :config
  (setq magit-push-always-verify nil)
  (setq transient-history-file (expand-file-name "magit-history.el" my-data-files-dir))

  (transient-append-suffix 'magit-push "e"
    '("P" "Push implicitly" magit-push-implicitly))

  (fullframe magit-status magit-mode-quit-window)

  )
