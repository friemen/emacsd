(provide 'my-js2)
(require-packages '(js2-mode flycheck))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)
