(provide 'my-js)

(require 'my-company)

(defun my-indium-repl-clear-output ()
  (interactive)
  (with-current-buffer "*JS REPL*"
    (indium-repl-clear-output)))

(defun my-js2-node-bounds (node)
  (let* ((begin (js2-node-abs-pos node))
         (end   (+ begin (js2-node-len node))))
    (message "%s" (cons begin end))
    (cons begin end)))

(defun my-js-indent-then-complete ()
  (interactive)
  (my-company-indent-then-complete #'js2-indent-line))


(use-package indium :ensure t
  :bind
  (:map indium-repl-mode-map
        ("C-c C-x" . indium-repl-clear-output))
  :init
  (require 'indium)
  (require' eval-sexp-fu)
  (setq indium-chrome-executable "/usr/bin/google-chrome")
  (setq indium-client-debug t)
  (define-eval-sexp-fu-flash-command indium-eval-defun
    (eval-sexp-fu-flash (my-js2-node-bounds (js2-mode-function-at-point))))
  (define-eval-sexp-fu-flash-command indium-eval-last-node
    (eval-sexp-fu-flash (my-js2-node-bounds (indium-interaction-node-before-point))))
  (define-eval-sexp-fu-flash-command indium-eval-buffer
    (eval-sexp-fu-flash (cons (point-min) (point-max))))
  (define-eval-sexp-fu-flash-command indium-eval-region
    (eval-sexp-fu-flash (cons (region-beginning) (region-end)))))


(use-package js2-mode :ensure t
  :bind
  (:map js2-mode-map
        ("C-c C-i" . prog-indent-sexp)
        ("<tab>" . my-js-indent-then-complete)
        ;; Indium interaction
        ("C-c M-c" . indium-launch)
        ("C-c C-c" . indium-eval-defun)
        ("C-c C-e" . indium-eval-last-node)
        ("C-C C-k" . indium-eval-buffer)
        ("C-c C-x" . my-indium-clear-repl-output)
        ("C-c C-q" . indium-quit))
  :init
  (require 'indium)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

  :config
  (add-hook 'js2-mode-hook 'indium-interaction-mode)
  (add-hook 'js2-mode-hook 'hs-minor-mode)
  (add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'js2-mode-hook 'highlight-symbol-mode)
  (add-hook 'js2-mode-hook 'company-mode)
  (font-lock-add-keywords 'js2-mode my-todo-keywords))
