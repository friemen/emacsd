
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
