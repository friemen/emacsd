(provide 'my-web)
(require-packages '(web-mode css-mode sass-mode company))


(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))


(defun web-mode-insert-link (href)
  (interactive "sInsert link with HREF: ")
  (let (el)
    (setq el (concat "<a href=\""
		   href
		   "\">"
		   (buffer-substring (region-beginning) (region-end))
		   "</a>"))
    (delete-active-region)
    (insert el)))

(defun my-web-mode-hook ()
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (highlight-symbol-mode))

(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'css-mode-hook 'company-mode)
