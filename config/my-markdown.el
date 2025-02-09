(provide 'my-markdown)

(use-package markdown-mode :ensure t
  :config
  (font-lock-add-keywords 'markdown-mode my-todo-keywords))
