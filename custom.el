

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (gandalf)))
 '(custom-safe-themes
   (quote
    ("4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" default)))
 '(global-visual-line-mode t)
 '(ido-max-window-height 10)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(menu-bar-mode t)
 '(org-agenda-files (quote ("~/falko.org")))
 '(org-startup-with-inline-images t)
 '(package-selected-packages
   (quote
    (neotree cider-test web-mode undo-tree typed-clojure-mode switch-window swiper smex smart-tab smart-mode-line-powerline-theme shm rainbow-delimiters projectile paxedit nrepl-eval-sexp-fu markdown-mode magit js2-mode impatient-mode ido-vertical-mode ido-ubiquitous gandalf-theme flycheck flx-ido expand-region emms elscreen dired+ company-ghc clojure-quick-repls clojure-cheatsheet clj-refactor cider-eval-sexp-fu auctex ace-jump-buffer ac-cider)))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "dark orange"))))
 '(eval-sexp-fu-flash ((t (:background "light coral" :foreground "white" :weight bold))))
 '(eval-sexp-fu-flash-face ((((class color)) (:background "rosy brown" :foreground "white" :bold t)) (t (:inverse-video t))))
 '(ido-subdir ((t (:background "white" :foreground "black"))))
 '(magit-item-highlight ((t (:background "gainsboro")))))
