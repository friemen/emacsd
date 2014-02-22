

;; Auto completion configuration
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.5)


;; Ace Jump configuration
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; Switch window configuration
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)


;; Markdown auto activate
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; ido configuration
(require 'ido)
(ido-mode t)


;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time

;; Tabbar/Tabbar-ruler configuration
(require 'tabbar)
(tabbar-mode t)
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)


(setq tabbar-background-color "#F6F8E3") ;; the color of the tabbar background


;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar
(require 'tabbar-ruler)

(defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to."
   (list
    (cond
     ((string-match "*cider-" (buffer-name))
      "REPL")
     ((string-match "*nrepl-" (buffer-name))
      "REPL")
     ((member (buffer-name)
	      '("*GNU Emacs*" "*Messages*" "*scratch*" "*helm*" "*Completions*"))
      "Emacs Buffer")
     ((string-match "*magit" (buffer-name))
      "Magit")
     (t "User Buffer"))))

