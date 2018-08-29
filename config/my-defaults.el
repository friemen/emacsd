(provide 'my-defaults)

;; turn off splash screen messages
(setq inhibit-startup-echo-area-message t
      inhibit-startup-screen t)

;; allow y and n instead of yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time

;; whitespace stripping
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(recentf-mode 1)
(delete-selection-mode 1)
(setq delete-active-region t)

;; remember positions in visited files
(setq save-place-file "~/.emacs.d/saveplace")
(toggle-save-place-globally)

;; no backup files, please
(setq backup-inhibited t)

;; support cut, copy, paste on C-x, C-c and C-v
(cua-mode)

;; make frame initially fullscreen
(toggle-frame-maximized)

;; no menu bar, no toolbar,
;; M-x menu-bar-mode and tool-bar-mode will toggle this
(menu-bar-mode 0)
(tool-bar-mode 0)

;; wrap long lines
(setq global-visual-line-mode t)

;; no scroll bars
(toggle-scroll-bar -1)

;; highlight other parens
(show-paren-mode t)

;; display line and column number in modeline
(column-number-mode 1)

;; how to display buffer names in modeline
(setq uniquify-buffer-name-style 'forward)

(setq ediff-split-window-function 'split-window-horizontally)

;; make C-i independent from TAB
;(define-key local-function-key-map [tab] nil)
