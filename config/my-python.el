(provide 'my-python)

(require 'my-hideshow)

(defun my-elpy-shell-clear-buffer ()
  (interactive)
  (with-current-buffer (process-buffer (elpy-shell-get-or-create-process))
    (comint-clear-buffer)))

(defun my-elpy-shell-kill-buffer ()
  (interactive)
  (elpy-shell-kill)
  (kill-this-buffer))

(defun my-elpy-system-reload ()
  (interactive)
  (python-shell-send-string "import system\nsystem.reload()"))

(use-package elpy :ensure t :defer t
  :bind
  (:map elpy-mode-map
        ("C-c M-c" . run-python)
        ("C-c C-c" . elpy-shell-send-top-statement)
        ("C-c C-k" . elpy-shell-send-buffer)
        ("C-c s" . my-elpy-system-reload)
        ("C-c C-x" . my-elpy-shell-clear-buffer)
   :map inferior-python-mode-map
        ("C-c s" . my-elpy-system-reload)
        ("C-c C-x" . my-elpy-shell-clear-buffer)
        ("C-c C-q" . my-elpy-shell-kill-buffer))

  :init
  (advice-add 'python-mode :before 'elpy-enable)

  :config
  (require 'eval-sexp-fu)
  (setq python-shell-interpreter "python3"
        python-shell-interpreter-args "-i")
  (setq elpy-shell-echo-input nil)
  (add-hook 'elpy-mode-hook 'highlight-symbol-mode)
  (add-hook 'elpy-mode-hook 'eval-sexp-fu-flash-mode)
  (add-hook 'elpy-mode-hook 'hs-minor-mode)
  (add-hook 'elpy-mode-hook 'rainbow-delimiters-mode)
  (font-lock-add-keywords 'python-mode my-todo-keywords))


(use-package auto-virtualenv :ensure t
  :config
  (setq auto-virtualenv-verbose nil)
  (auto-virtualenv-setup))
