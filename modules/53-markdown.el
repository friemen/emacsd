
(require-package 'markdown-mode)


;; Markdown auto activate
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(define-key markdown-mode-map (kbd "M-<left>") 'tabbar-backward-tab)
(define-key markdown-mode-map (kbd "M-<right>") 'tabbar-forward-tab)



