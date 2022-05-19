(provide 'my-magit)

(use-package fullframe :ensure t)


(defun magit-push-to-gerrit-local-branch-or-commit (source)
  "Push an arbitrary branch or commit to Gerrit server. The source is read in the minibuffer."
  (interactive
   (let ((source (magit-read-local-branch-or-commit "Push")))
     (list source)))
  (magit-git-command-topdir (concat "git push origin " source (concat ":refs/for/" source))))

(defun magit-push-to-gerrit-current-branch ()
  "Push current branch to Gerrit server."
  (interactive)
  (magit-push-to-gerrit-local-branch-or-commit (magit-get-current-branch)))


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
  (transient-append-suffix 'magit-push "e"
    '("g" "Push current branch to Gerrit" magit-push-to-gerrit-current-branch))
  (transient-append-suffix 'magit-push "e"
    '("G" "Push a branch to Gerrit" magit-push-to-gerrit-local-branch-or-commit))

  (fullframe magit-status magit-mode-quit-window)
  )
