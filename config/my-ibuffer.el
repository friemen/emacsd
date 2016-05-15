(provide 'my-ibuffer)
(require-package 'ibuffer)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (visual-line-mode 0)
	    (toggle-truncate-lines t)
	    (ibuffer-do-sort-by-filename/process)
	    (hl-line-mode)))
