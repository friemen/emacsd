(provide 'my-yasnippet)

(use-package yasnippet :ensure t
  :bind
  (("C-x y" . yas-insert-snippet))

  :hook
  (prog-mode . yas-minor-mode)

  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-reload-all)

  :diminish
  yas-minor-mode

  )
