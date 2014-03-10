
;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(global-set-key (kbd "C-7") 'web-mode-element-close)


