(provide 'my-dired)

(defun my-dired-up-directory ()
  (interactive)
  (find-alternate-file ".."))

(defun my-dired-find-file ()
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
	(or (and (cdr dired-subdir-alist)
		 (dired-goto-subdir file))
	    (find-alternate-file file))
      (view-file file))))


(use-package dired
  :bind
  (("C-x C-d" . dired-jump)
   ("C-x d" . dired)
   :map dired-mode-map
   ("<enter>" . my-dired-find-file)
   ("<backspace>" . my-dired-up-directory)
   ("^" . my-dired-up-directory)
   ("." . dired-omit-mode)
   ("<tab>" . dired-hide-details-mode)
   ("?" . hydra-dired/body))

  :config
  (require 'dired-x)
  (add-to-list 'dired-guess-shell-alist-default
               (list my-xdg-open-file-extension-re "xdg-open"))
  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")
  (setq dired-listing-switches "-lAhgG --group-directories-first")
  (setq dired-dwim-target t)

  (add-hook 'dired-mode-hook (lambda ()
                               (dired-omit-mode 1)
                               (hl-line-mode)
                               (dired-hide-details-mode 1)))
  (add-hook 'dired-load-hook (lambda ()
                               (hydra-dired/body))))


(defhydra hydra-dired (:hint nil) "
 Navigate^^                       Mark^^           Show/Hide^^
-----------------------------------------------------------------------------------------------
 [_<backspace>_]  Dir up          [_m_]  Mark      [_._]      Hidden files   [_R_]  Rename
 [_<enter>_]      Visit item      [_u_]  Unmark    [_<tab>_]  File details   [_C_]  Copy
 [_<up>_]         Next item       ^^               [_g_]      Refresh        [_D_]  Delete
 [_<down>_]       Previous item
 "
  ("<backspace>" diredp-up-directory-reuse-dir-buffer)
  ("<enter>" diredp-find-file-reuse-dir-buffer)
  ("<up>" diredp-previous-line)
  ("<down>" diredp-next-line)
  ("m" dired-mark)
  ("u" dired-unmark)
  ("." dired-omit-mode)
  ("<tab>" dired-hide-details-mode)
  ("g" revert-buffer)
  ("R" dired-do-rename)
  ("C" dired-do-copy)
  ("D" dired-do-delete)
  ("q" nil))
