(provide 'my-elscreen)
(require-package 'elscreen)

(setq elscreen-prefix-key (kbd "C-c C-s"))
(setq elscreen-display-screen-number 1)
(setq elscreen-display-tab nil)
(elscreen-start)
