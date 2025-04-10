(provide 'my-web-css-sass)

(require 'flymake-proc) ;; see https://github.com/haskell/haskell-mode/issues/1825

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

(defun my-web-mode-indent-buffer ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (point-min) (point-max) nil)
  (pop-global-mark))

(defun my-css-indent-2 ()
  (interactive)
  (setq css-indent-offset 2)
  (message "CSS indentation width set to 2 spaces"))

(defun my-css-indent-4 ()
  (interactive)
  (setq css-indent-offset 4)
  (message "CSS indentation width set to 4 spaces"))

(use-package web-mode :ensure t
  :mode "\\.html?\\'"
  :bind
  (:map web-mode-map
        ("C-c C-i" . my-web-mode-indent-buffer)
        ("C-7" . web-mode-element-close)
        ("C-c C-e l" . my-web-mode-insert-link)
        ("C-c x x" . web-mode-fold-or-unfold)
        ("C-SPC" . web-mode-mark-and-expand))

  :config
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (add-hook 'web-mode-hook 'company-mode)
  (font-lock-add-keywords 'web-mode my-todo-keywords))

(use-package css-mode :ensure t
  :bind
  (:map css-mode-map
        ("C-c C-i" . my-web-mode-indent-buffer))
  :config
  (add-hook 'css-mode-hook 'company-mode)
  (font-lock-add-keywords 'css-mode my-todo-keywords))

(use-package sass-mode :ensure t
  :mode "\\.sass\\'"
  :bind
  (:map sass-mode-map
        ("C-c C-i" . my-web-mode-indent-buffer))
  :config
  (add-hook 'sass-mode-hook 'company-mode)
  (font-lock-add-keywords 'sass-mode my-todo-keywords))

(use-package scss-mode :ensure t
  :mode "\\.scss\\'"
  :bind
  (:map scss-mode-map
        ("C-c C-i" . my-web-mode-indent-buffer))
  :config
  (add-hook 'scss-mode-hook 'company-mode)
  (font-lock-add-keywords 'scss-mode my-todo-keywords))
