
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-default-cljs-repl "(user/fig-repl)")
 '(cider-font-lock-dynamically '(macro function var core))
 '(cider-print-fn 'fipp)
 '(cider-repl-display-help-banner nil)
 '(cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
 '(cider-save-file-on-load nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("b9decd202920385947c367b6b266f96b77f7a5c866052cc02a48e72e84820924"
     "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78"
     "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd"
     "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1"
     "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc"
     "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c"
     default))
 '(ibuffer-default-sorting-mode 'filename/process)
 '(notmuch-search-oldest-first nil)
 '(package-selected-packages nil)
 '(sml/no-confirm-load-theme t)
 '(sml/theme 'light))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(cider-test-error-face ((t (:background "#d08770"))))
 '(cider-test-failure-face ((t (:background "#bf616a"))))
 '(cider-test-success-face ((t (:background "#a3be8c" :foreground "black"))))
 '(cursor ((t (:background "#E65C39"))))
 '(diary ((t (:foreground "#a3be8c"))))
 '(dired-broken-symlink ((t (:background "#bf616a" :foreground "#ebcb8b" :weight bold))))
 '(dired-directory ((t (:foreground "#ebcb8b"))))
 '(dired-directory-face ((t (:foreground "#ebcb8b"))))
 '(dired-marked ((t (:foreground "#88C0D0"))))
 '(eval-sexp-fu-flash ((t (:background "#b48ead"))))
 '(highlight ((t (:background "#81a1c1" :foreground "#2e3440"))))
 '(highlight-symbol-face ((t (:background "gray30"))))
 '(linum ((t :foreground "#4c566a")))
 '(magit-diff-added ((t (:extend t :background "#a3be8c" :foreground "#2e3440"))))
 '(magit-diff-added-highlight ((t (:extend t :background "#a3be8c" :foreground "#2e3440"))))
 '(magit-diff-removed ((t (:extend t :background "#bf616a" :foreground "#2e3440"))))
 '(magit-diff-removed-highlight ((t (:extend t :background "#bf616a" :foreground "#2e3440"))))
 '(markdown-code-face ((t (:inherit nil :foreground "dark gray"))))
 '(mode-line ((t :foreground "#2e3440" :background "#81a1c1" :inverse-video nil)))
 '(mode-line-inactive ((t :foreground "#2e3440" :background "#d8dee9" :inverse-video nil)))
 '(notmuch-tag-face ((t :foreground "#a3be8c")))
 '(notmuch-tag-flagged ((t :foreground "#ebcb8b")))
 '(notmuch-tag-unread ((t :foreground "#5e81ac")))
 '(org-agenda-date ((t (:foreground "#88C0D0" :underline t :height 1.2))))
 '(org-agenda-date-today ((t (:foreground "#88C0D0" :underline t :weight bold :height 1.2))))
 '(org-agenda-date-weekend ((t (:foreground "#81A1C1" :underline t :height 1.2))))
 '(org-block ((t (:extend t :background "gray12" :foreground "#D8DEE9"))))
 '(org-block-begin-line ((t (:extend t :background "gray12" :foreground "#8FBCBB"))))
 '(org-block-end-line ((t (:extend t :background "gray12" :foreground "#8FBCBB"))))
 '(org-code ((t (:foreground "#a3be8c"))))
 '(org-drawer ((t (:foreground "dark gray" :height 0.8))))
 '(org-headline-done ((t (:foreground "#4c566a"))))
 '(org-headline-todo ((t (:foreground "#81a1c1"))))
 '(org-level-1 ((t (:extend nil :foreground "#8FBCBB" :weight extra-bold :height 1.5))))
 '(org-level-2 ((t (:extend nil :foreground "#81a1c1" :weight bold :height 1.2))))
 '(region ((t (:extend t :background "#7DB0BF" :foreground "#2e3440"))))
 '(shr-link ((t (:foreground "#EBCB8B"))))
 '(sml/filename ((t (:inherit sml/global :foreground "#2e3440" :weight bold))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "#bf616a" :weight bold))))
 '(sml/read-only ((t (:inherit sml/not-modified :foreground "#4c566a" :weight bold))))
 '(spaceline-highlight-face ((t :foreground "#2e3440" :background "#a3be8c")))
 '(treemacs-root-face ((t (:inherit font-lock-constant-face :weight bold :height 1.0)))))
