(provide 'my-company)

(use-package company :ensure t
  :diminish

  :bind
  (:map company-mode-map
        ("<tab>" . my-indent-and-complete-symbol))

  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (defun my-indent-and-complete-symbol ()
    (interactive)
    (let ((pos (point)))
      (lisp-indent-line)
      (when (= pos (point))
        (if (save-excursion (re-search-backward "[^() \n\t\r]+\\=" nil t))
            (company-complete)))))
  )
