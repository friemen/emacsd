(provide 'my-nxml)
(require 'nxml-mode)

(add-to-list 'auto-mode-alist
	     (cons (concat "\\." (regexp-opt '("xml"
					       "xsd"
					       "rng"
					       "xslt"
					       "xsl")
					     t) "\\'")
		   'nxml-mode))

(add-hook 'nxml-mode-hook
	  '(lambda ()
	     (define-key nxml-mode-map (kbd "C-7") 'nxml-finish-element)
	     (highlight-symbol-mode)))

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
