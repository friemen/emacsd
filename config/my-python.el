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
        python-shell-interpreter-args "-i")
  (font-lock-add-keywords 'python-mode my-todo-keywords))


(use-package pyvenv :ensure t
  :config
  (pyvenv-mode t)

  ;; set correct Python interpreter, after venv is selected
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (message "Using venv %s" pyvenv-virtual-env)
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))
