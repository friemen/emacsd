(defvar web-packages '(js2-mode
		       web-mode
		       flycheck))

(dolist (p web-packages)
  (require-package p))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-mode
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
  (define-key web-mode-map (kbd "C-c q q") 'web-mode-fold-or-unfold)
  (define-key web-mode-map (kbd "C-SPC") 'web-mode-mark-and-expand))

(add-hook 'web-mode-hook 'my-web-mode-hook)


;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)


;; nxml-mode
(require 'nxml-mode)
(add-to-list 'auto-mode-alist
	     (cons (concat "\\." (regexp-opt '("xml" "xsd" "rng" "xslt" "xsl") t) "\\'")
		   'nxml-mode))

(add-hook 'nxml-mode-hook
	  '(lambda ()
	     (define-key nxml-mode-map (kbd "C-7") 'nxml-finish-element)))

(defun my-pretty-print-xml-region (begin end)
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end)))

(add-to-list 'hs-special-modes-alist
             (list 'nxml-mode
                   "<!--\\|<[^/>]*[^/]>"
                   "-->\\|</[^/>]*[^/]>"
                   "<!--"
                   'nxml-forward-element
                   nil))
