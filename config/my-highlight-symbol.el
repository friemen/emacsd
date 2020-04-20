(provide 'my-highlight-symbol)

(use-package highlight-symbol :ensure t
  :diminish

  :bind
  (("C-+" . highlight-symbol-at-point)
   ("C-]" . highlight-symbol-at-point))

  :config
  (setq highlight-symbol-colors '("Sky Blue" "Pink" "Gold" "Thistle"
                                  "Green Yellow" "Light Salmon"))
  (setq highlight-symbol-idle-delay 0.7)
  (setq highlight-symbol-should-auto-highlight-p 1)
  (setq highlight-symbol-occurrence-message nil)
  )
