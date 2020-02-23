(provide 'my-dired)

;; dired+ is not available in any repo, use copy from EmacsWiki
(add-to-list 'load-path (concat user-emacs-directory "emacswiki/dired+"))

(use-package dired
  :init
  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")

  :bind
  (("C-x C-d" . dired-jump)
   ("C-x d" . dired)
   :map dired-mode-map
   ("<backspace>" . diredp-up-directory-reuse-dir-buffer)
   ("." . dired-omit-mode)
   ("<tab>" . dired-hide-details-mode)
   ("?" . hydra-dired/body))

  :config
  (require 'dired+)
  (toggle-diredp-find-file-reuse-dir 1)
  (diredp-make-find-file-keys-reuse-dirs)
  (add-hook 'dired-mode-hook (lambda ()
                               (dired-omit-mode 1)
                               (hl-line-mode)))
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
  ("q" nil)
  )
