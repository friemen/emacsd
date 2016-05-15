(provide 'my-magit)
(require-package 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-push-always-verify nil)

(magit-define-popup-action
  'magit-push-popup
  ?P
  "Push implicitly"
  'magit-push-implicitly)

(custom-set-faces
 '(magit-item-highlight ((t (:background "gainsboro")))))
