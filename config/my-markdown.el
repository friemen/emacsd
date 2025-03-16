(provide 'my-markdown)

(use-package markdown-mode :ensure t
  :config
  (setq markdown-command "pandoc -f gfm")
  (font-lock-add-keywords 'markdown-mode my-todo-keywords))
