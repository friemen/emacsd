(provide 'my-lisp-utils)

(require 'my-company)

(defun my-delete-whitespace-except-one ()
  "Deletes all whitespace chars following point except one space."
  (interactive)
  (just-one-space -1))


(defun my-delete-region-or-char ()
  "Deletes a region if active, or the char after the point."
  (interactive)
  (if (use-region-p)
      (paredit-delete-region (region-beginning) (region-end))
    (paredit-forward-delete)))


(defun my-elisp-indent-then-complete ()
  (interactive)
  (my-company-indent-then-complete #'lisp-indent-line))


(defun my-indent-defun ()
  (interactive)
  (save-excursion
    (beginning-of-defun)
    (indent-sexp)))


(defun my-goto-end-of-form-rec (p)
  (let ((next-pos (paxedit-sexp-move-to-core-start)))
    (cond ((looking-at ".comment")
           (progn (message "comment")
                  (goto-char p)
                  (paredit-forward)))

          ((numberp next-pos)
           (my-goto-end-of-form-rec next-pos))

          (t
           (paredit-forward)))))


(defun my-goto-end-of-form ()
  (interactive)
  (my-goto-end-of-form-rec (point)))


(defun my-end-of-form ()
  (save-excursion
    (my-goto-end-of-form)
    (point)))


(defun my-beginning-of-form ()
  (save-excursion
    (my-goto-end-of-form)
    (paredit-backward)
    (point)))
