(provide 'my-browse-kill-ring)

(defun my-clear-kill-ring ()
  (interactive)
  (setq kill-ring nil)
  (garbage-collect)
  (browse-kill-ring-update))

(use-package browse-kill-ring :ensure t
  :bind
  (("<C-insert>" . browse-kill-ring)
   :map browse-kill-ring-mode-map
   ("k" . my-clear-kill-ring)))
