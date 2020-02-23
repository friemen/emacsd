(provide 'my-hideshow)

(use-package hideshow
  :bind
  (:map hs-minor-mode-map
        ("C-c x x" . hs-toggle-hiding)
        ("C-c x h" . hs-hide-all)
        ("C-c x s" . hs-show-all)))
