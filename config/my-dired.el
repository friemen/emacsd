(provide 'my-dired)

(use-package dired-single :ensure t)

(use-package dired
  :bind
  (("C-x C-d" . dired-jump)
   ("C-x d" . hydra-dired-goto/body)
   :map dired-mode-map
   ("RET" . dired-single-buffer)
   ("<backspace>" . dired-single-up-directory)
   ("^" . dired-single-up-directory)
   ("." . dired-omit-mode)
   ("<tab>" . dired-hide-details-mode)
   ("q" . kill-this-buffer)
   ("?" . hydra-dired/body))

  :config
  (require 'dired-x)
  (require 'dired-single)
  (add-to-list 'dired-guess-shell-alist-user
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
 Navigate^^                       Mark^^              Show/Hide^^
-----------------------------------------------------------------------------------------------
 [_<backspace>_]  Dir up          [_m_]  Mark         [_._]      Hidden files   [_R_]  Rename
 [_RET_]          Visit item      [_u_]  Unmark       [_<tab>_]  File details   [_C_]  Copy
 [_<up>_]         Next item       [_U_]  Unmark all   [_g_]      Refresh        [_D_]  Delete
 [_<down>_]       Previous item
 "
  ("<backspace>" dired-single-up-directory)
  ("RET" dired-single-buffer)
  ("<up>" dired-previous-line)
  ("<down>" dired-next-line)
  ("m" dired-mark)
  ("u" dired-unmark)
  ("U" dired-unmark-all)
  ("." dired-omit-mode)
  ("<tab>" dired-hide-details-mode)
  ("g" revert-buffer)
  ("R" dired-do-rename)
  ("C" dired-do-copy)
  ("D" dired-do-delete)
  ("q" nil))


(defhydra hydra-dired-goto (:hint nil :exit t) "
 Dired open^^
--------------------------------------------------------------------------------------------
[_h_]  Home              [_d_]  Downloads         [_p_]  dt/projects       [_t_]  /tmp

"
  ("h"  (lambda () (interactive) (dired "~")))
  ("p"  (lambda () (interactive) (dired "~/Workspaces/dt/projects")))
  ("d"  (lambda () (interactive) (dired "~/Downloads")))
  ("t"  (lambda () (interactive) (dired "/tmp"))))
