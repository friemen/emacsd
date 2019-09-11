(provide 'my-window-control)

(defun my-split-and-switch-to-window-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun my-split-and-switch-to-window-right ()
  (interactive)
  (split-window-right)
  (other-window 1))
