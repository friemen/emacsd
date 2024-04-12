(provide 'my-ibuffer)

(defun my-ibuffer-visit-buffer ()
  (interactive)
  (let ((window-config fullframe/previous-window-configuration)
        (buf (ibuffer-current-buffer t)))
    (fullframe/maybe-restore-configuration window-config)
    (switch-to-buffer buf)))

(use-package ibuffer
  :bind
  (("C-x C-b" . ibuffer)
   :map ibuffer-mode-map
   ("RET" . my-ibuffer-visit-buffer))
  :config
  (add-hook 'ibuffer-mode-hook (lambda () (hl-line-mode t)))
  (fullframe ibuffer quit-window))
