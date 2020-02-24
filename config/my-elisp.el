(provide 'my-elisp)

(use-package lisp-mode
  :bind
  (:map emacs-lisp-mode-map
        ("C-c C-c" . eval-defun)
        ("C-c C-k" . eval-buffer)
        ("C-c C-d" . my-elisp-describe-thing-in-popup)
        ("C-M-<" . mc/mark-all-symbols-like-this)
        ("C-<" . mc/mark-all-symbols-like-this-in-defun))

  :config
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

  (defun my-elisp-describe-thing-in-popup ()
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
  )
