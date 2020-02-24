(provide 'my-treemacs)

;; force treemacs to restore it's state first otherwise treemacs
;; somehow fails to read its state when a project is visited first via
;; projectile
(setq treemacs-persist-file
      (expand-file-name "treemacs-persist" my-data-files-dir))
(setq treemacs-last-error-persist-file
      (expand-file-name "treemacs-last-error-persist" my-data-files-dir))
(require-packages '(treemacs treemacs-projectile treemacs-magit))
(treemacs--restore)


(use-package treemacs :ensure t
  :bind
  (("<C-dead-circumflex>" . my-treemacs-activate)
   ("C-^" . my-treemacs-activate)
   ("C-x t 1"   . treemacs-delete-other-windows)
   ("C-x t t"   . treemacs)
   ("C-x t B"   . treemacs-bookmark)
   ("C-x t C-t" . treemacs-find-file)
   ("C-x t M-t" . treemacs-find-tag)
   :map treemacs-mode-map
   ("C-g" . treemacs-quit))

  :config
  (setq treemacs-collapse-dirs 3)
  (setq treemacs-git-mode 'deferred)
  (treemacs-resize-icons 12)

  (defun my-treemacs-activate ()
    (interactive)
    (if (treemacs-is-treemacs-window-selected?)
        (treemacs-quit)
      (treemacs-select-window)))

  (defun my-treemacs-quit ()
    (interactive)
    (when (treemacs-current-visibility)
      (treemacs-select-window)
      (treemacs-quit)))

  (add-hook 'ediff-before-setup-hook
            (lambda () (my-treemacs-quit)))
  )

(use-package treemacs-projectile :ensure t
  :after treemacs projectile)

(use-package treemacs-magit :ensure t
  :after treemacs magit)
