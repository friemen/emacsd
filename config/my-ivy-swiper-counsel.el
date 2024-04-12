(provide 'my-ivy-swiper-counsel)

(defun my-region-text ()
  (if mark-active
      (buffer-substring-no-properties (region-beginning) (region-end))))

(use-package smex :ensure t
  :config
  (setq smex-save-file (expand-file-name "smex-items.el" my-data-files-dir)))

(use-package ivy :ensure t
  :diminish

  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
  ;; (global-set-key (kbd "<f6>") 'ivy-resume)
  )

(use-package swiper :ensure t
  :bind
  (("C-s" . swiper)))

(use-package counsel :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-y" . my-git-grep)
   ("C-t" . my-git-grep)
   ("C-x C-f" . counsel-find-file)
   ("C-x f" . counsel-recentf))
  :config
  ;; flip ivy done actions to avoid opening dired when a dir in counsel-find-file
  (let ((done (where-is-internal #'ivy-done     ivy-minibuffer-map t))
        (alt  (where-is-internal #'ivy-alt-done ivy-minibuffer-map t)))
    (define-key counsel-find-file-map done #'ivy-alt-done)
    (define-key counsel-find-file-map alt  #'ivy-done))

  (defun my-git-grep ()
    (interactive)
    (let ((text (my-region-text)))
      (deactivate-mark)
      (counsel-git-grep text)))
  )
