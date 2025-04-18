(provide 'my-elisp)

(require 'my-lisp-utils)
(require 'my-highlight-symbol)
(require 'my-company)
(require 'my-hideshow)

(use-package lisp-mode
  :bind
  (:map paredit-mode-map
        ("C-c C-i" . nil)
   :map emacs-lisp-mode-map
        ("RET" . nil)
        ("C-j" . paredit-RET)
        ("C-c C-c" . eval-defun)
        ("C-c C-k" . eval-buffer)
        ("C-c C-d" . my-elisp-describe-symbol-at-point)
        ("C-c C-i" . my-indent-defun)
        ("C-M-." . mc/mark-all-symbols-like-this)
        ("C-." . mc/mark-all-symbols-like-this-in-defun)
        ("<tab>" . my-elisp-indent-then-complete))

  :config
  (require 'my-paredit)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'company-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda ()
                                    (diminish 'eldoc-mode)
                                    (diminish 'hs-minor-mode)))
  (font-lock-add-keywords 'emacs-lisp-mode my-todo-keywords)

  (defun my-elisp-describe-symbol-at-point-in-popup ()
    (interactive)
    (let* ((thing (symbol-at-point))
           (help-xref-following t)
           (description (save-window-excursion
                          (switch-to-buffer "*Help*")
                          (help-mode)
                          (describe-symbol thing)
                          (buffer-string))))
      (popup-tip description
                 :point (point)
                 :around t
                 :height 30
                 :scroll-bar t
                 :margin t)))


  (defun my-elisp-describe-symbol-at-point ()
    (interactive)
    (let* ((thing (symbol-at-point)))
      (describe-symbol thing)))
  )
