(provide 'my-python)

(defun my-elpy-shell-clear-buffer ()
  (interactive)
  (with-current-buffer (process-buffer (elpy-shell-get-or-create-process))
    (comint-clear-buffer)))

(use-package elpy :ensure t :defer t
  :bind
  (:map elpy-mode-map
        ("C-c C-x" . my-elpy-shell-clear-buffer)
   :map inferior-python-mode-map
        ("C-c C-x" . my-elpy-shell-clear-buffer))

  :init
  (advice-add 'python-mode :before 'elpy-enable)

  :config
  (setq python-shell-interpreter "python3"
        python-shell-interpreter-args "-i"))
