(provide 'my-nxml)

(use-package sgml-mode :ensure t)

(use-package nxml :ensure t
  :bind
  (:map nxml-mode-map
        ("C-7" . nxml-finish-element))

  :init
  (font-lock-add-keywords 'nxml-mode my-todo-keywords)

  :config
  (add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))

  (add-hook 'nxml-mode-hook 'hs-minor-mode)
  (add-hook 'nxml-mode-hook 'highlight-symbol-mode))
