(provide 'my-magit)

(require-packages '(fullframe
		    magit))

(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-push-always-verify nil)

(transient-append-suffix 'magit-push "e"
  '("P" "Push implicitly" magit-push-implicitly))

(custom-set-faces
 '(magit-item-highlight ((t (:background "gainsboro")))))

(fullframe magit-status magit-mode-quit-window)
