(provide 'my-company)

(defvar my-company-enable-yas t)
(defun my-company-backend-with-yas (backend)
  (if (or (not my-company-enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(use-package company :ensure t
  :diminish

  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (defun my-indent-and-complete-symbol ()
    (interactive)
    (let ((pos (point)))
      (lisp-indent-line)
      (when (= pos (point))
        (if (save-excursion (re-search-backward "[^() \n\t\r]+\\=" nil t))
            (company-complete)))))

  (setq company-backends (mapcar #'my-company-backend-with-yas company-backends)))
