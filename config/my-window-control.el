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

(defun my-window-left-margin-increase ()
  (interactive)
  (let ((lmargin (car (window-margins))))
    (set-window-margins nil (+ (or lmargin 0) 10) 0)))

(defun my-window-left-margin-decrease ()
  (interactive)
  (let ((lmargin (car (window-margins))))
    (when (and lmargin (> lmargin 0))
      (set-window-margins nil (- lmargin 10) 0))))

(defun my-text-scale-reset ()
  (interactive)
  (text-scale-adjust 0))

(defun my-buffer-show-and-tell-toggle ()
  (interactive)
  (if display-line-numbers-mode
      (progn
        (text-scale-adjust 0)
        (hl-line-mode 0)
        (display-line-numbers-mode 0))
    (progn
      (text-scale-adjust 3)
      (hl-line-mode 1)
      (display-line-numbers-mode 1))))


(defhydra hydra-window-control (:hint nil) "
 Display settings      ^^     ^^               More/Less windows^^    Go to window^^        Resize active window^^                 Swap buffers^^                      Buffer file
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 [_+_]  Zoom In        [_h_]  Highlight line   [_r_]  Split right     [_<left>_]   Left     [_C-<left>_]   Shrink horizontally     [_M-<left>_]   With left window     [_C_] Copy
 [_-_]  Zoom Out       [_n_]  Line numbers     [_d_]  Split down      [_<right>_]  Right    [_C-<right>_]  Enlarge horizontally    [_M-<right>_]  With right window    [_D_] Delete
 [_0_]  Reset          [_t_]  Show+tell        [_k_]  Kill this       [_<up>_]     Up       [_C-<up>_]     Shrink vertically       [_M-<up>_]     With window above    [_R_] Rename
 [_m_]  Margin +       ^^                      [_1_]  Kill others     [_<down>_]   Down     [_C-<down>_]   Enlarge vertically      [_M-<down>_]   With window below    [_W_] Write
 [_M_]  Margin -       ^^                      ^^                     [_=_]        Balance areas
"

  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("0" my-text-scale-reset)
  ("m" my-window-left-margin-increase)
  ("M" my-window-left-margin-decrease)
  ("t" my-buffer-show-and-tell-toggle :exit t)
  ("h" hl-line-mode :exit t)
  ("n" display-line-numbers-mode :exit t)
  ("=" balance-windows-area)
  ("k" delete-window :exit t)
  ("1" delete-other-windows :exit t)
  ("r" my-split-and-switch-to-window-right)
  ("d" my-split-and-switch-to-window-below)
  ("R" my-rename-current-buffer-file :exit t)
  ("D" my-delete-current-buffer-file :exit t)
  ("C" my-copy-current-buffer-file :exit t)
  ("W" write-file :exit t)
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
