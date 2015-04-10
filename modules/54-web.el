(defvar web-packages '(
        js2-mode
	web-mode))

(dolist (p web-packages)
  (require-package p))

;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

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
  (define-key web-mode-map (kbd "C-7") 'web-mode-element-close)
  (define-key web-mode-map (kbd "C-c C-e l") 'web-mode-insert-link)
  (define-key web-mode-map (kbd "C-SPC") 'web-mode-mark-and-expand))

(add-hook 'web-mode-hook 'my-web-mode-hook)


;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)

