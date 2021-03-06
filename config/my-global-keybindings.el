(provide 'my-global-keybindings)

(global-set-key (kbd "C-x C-z") nil) ;; don't suspend or minimize emacs
(global-set-key (kbd "C-/") 'comment-or-uncomment-region) ;; no undo please, C-z is sufficient
(global-set-key (kbd "C-o") 'hydra-window-control/body)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-r") 'replace-string)
(global-set-key (kbd "C-<prior>") 'previous-buffer)
(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-<") 'my-push-mark)
(global-set-key (kbd "M->") 'my-jump-to-mark)
(global-set-key (kbd "<menu>") 'counsel-M-x)
(global-set-key (kbd "C-t") nil)
