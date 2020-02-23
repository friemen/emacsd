(provide 'my-projectile)

;; (defun my-projectile-switch-project-action ()
;;   (interactive)
;;   (cond
;;    ((consp (delete (current-buffer) (projectile-project-buffers)))
;;     (projectile-switch-to-buffer))
;;    ((consp (projectile-recentf-files))
;;     (projectile-recentf))
;;    (t
;;     (projectile-find-file))))


(defun my-projectile-open-root-dir ()
  (interactive)
  (dired-jump nil (projectile-project-root)))



(use-package projectile :ensure t
  :diminish

  :init
  (setq projectile-completion-system 'ivy)
  ;;(setq projectile-switch-project-action 'my-projectile-switch-project-action)
  (setq projectile-switch-project-action 'projectile-find-file)

  :bind
  ("C-c p" . hydra-projectile/body)

  :config
  (projectile-mode 1)

  :hydra
  (hydra-projectile (:hint nil :exit t) "
Project: %(projectile-project-root)

 Visit^^               Search/Replace^^       Other
------------------------------------------------------------------------------------------
 [_f_]  File           [_g_]  Grep            [_l_]  List buffers
 [_p_]  Project        [_R_]  Replace         [_k_]  Kill buffers
 [_b_]  Buffer         ^^                     [_t_]  Treemacs add
 [_r_]  Recent file
 [_d_]  Dir
"
  ("f" projectile-find-file)
  ("p" projectile-switch-project)
  ("b" projectile-switch-to-buffer)
  ("r" projectile-recentf)
  ("d" my-projectile-open-root-dir)

  ("g" projectile-grep)
  ("R" projectile-replace)

  ("l" projectile-ibuffer)
  ("k" projectile-kill-buffers)
  ("t" treemacs-add-project-to-workspace)
  ("q" nil))
  )
