(provide 'my-window-control)

(require 'my-file-utils)

(use-package buffer-move :ensure t)

(defun my-split-and-switch-to-window-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun my-split-and-switch-to-window-right ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun my-text-scale-reset ()
  (interactive)
  (text-scale-adjust 0))


(defhydra hydra-window-control (:hint nil) "
 Zoom^^          More/Less windows^^    Go to window^^        Resize active window^^                 Swap buffers^^                      Buffer file
------------------------------------------------------------------------------------------------------------------------------------------------------
 [_+_]  In       [_p_]  Split right     [_<left>_]   Left     [_C-<left>_]   Shrink horizontally     [_M-<left>_]   With left window     [_c_] Copy
 [_-_]  Out      [_l_]  Split down      [_<right>_]  Right    [_C-<right>_]  Enlarge horizontally    [_M-<right>_]  With right window    [_d_] Delete
 [_0_]  Reset    [_k_]  Kill this       [_<up>_]     Up       [_C-<up>_]     Shrink vertically       [_M-<up>_]     With window above    [_r_] Rename
 ^^              [_1_]  Kill others     [_<down>_]   Down     [_C-<down>_]   Enlarge vertically      [_M-<down>_]   With window below    [_w_] Write
 ^^              ^^                     ^^                    [_=_]          Balance areas"

  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("0" my-text-scale-reset)
  ("=" balance-windows-area)
  ("k" delete-window)
  ("1" delete-other-windows :exit t)
  ("p" my-split-and-switch-to-window-right)
  ("l" my-split-and-switch-to-window-below)
  ("r" my-rename-current-buffer-file :exit t)
  ("d" my-delete-current-buffer-file :exit t)
  ("c" my-copy-current-buffer-file :exit t)
  ("w" write-file :exit t)
  ("<left>" windmove-left)
  ("<right>" windmove-right)
  ("<up>" windmove-up)
  ("<down>" windmove-down)
  ("C-<left>" shrink-window-horizontally)
  ("C-<right>" enlarge-window-horizontally)
  ("C-<up>" shrink-window)
  ("C-<down>" enlarge-window)
  ("M-<left>" buf-move-left)
  ("M-<right>" buf-move-right)
  ("M-<up>" buf-move-up)
  ("M-<down>" buf-move-down)
  ("C-o" nil)
  ("q" nil))
