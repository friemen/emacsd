
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

;; Automatically save buffers before compiling
(setq compilation-ask-about-save nil)

;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time


(custom-set-variables
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(ido-max-window-height 10)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(menu-bar-mode t)
 '(org-startup-with-inline-images t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(delete-selection-mode 1)

(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(cider-eval-sexp-fu-flash ((t (:background "rosy brown" :foreground "white" :weight bold)))))

(set-cursor-color "#ffa000")


