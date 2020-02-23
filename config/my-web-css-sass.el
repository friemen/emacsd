(provide 'my-web-css-sass)

(use-package web-mode :ensure t
  :mode "\\.html?\\'"

  :bind
  (:map web-mode-map
        ("C-7" . web-mode-element-close)
        ("C-c C-e l" . my-web-mode-insert-link)
        ("C-c x x" . web-mode-fold-or-unfold)
        ("C-SPC" . web-mode-mark-and-expand))

  :config
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (add-hook 'web-mode-hook 'company-mode)
  )

(use-package css-mode :ensure t
  :config
  (add-hook 'css-mode-hook 'company-mode))

(use-package sass-mode :ensure t
  :mode "\\.sass\\'"
  :config
  (add-hook 'sass-mode-hook 'company-mode))

(use-package scss-mode :ensure t
  :mode "\\.scss\\'"
  :config
  (add-hook 'scss-mode-hook 'company-mode))


(defun my-web-mode-insert-link (href)
  (interactive "sInsert link with HREF: ")
  (let (el)
    (setq el (concat "<a href=\""
		   href
		   "\">"
		   (buffer-substring (region-beginning) (region-end))
		   "</a>"))
    (delete-active-region)
    (insert el)))
