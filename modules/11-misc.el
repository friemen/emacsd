
(defvar misc-packages '(
	ace-jump-mode
	ace-jump-buffer
	auctex
	dired+
	dash
	ediff
	emms
	eshell
	expand-region
	flx-ido
	gandalf-theme
	helm
	highlight
	ibuffer
	ido
	ido-ubiquitous
	ido-vertical-mode
	impatient-mode
	magit
	markdown-mode
	multiple-cursors
	org
	popup
	projectile
	recentf
	smart-tab
	smart-mode-line
	smart-mode-line-powerline-theme
	smex
        speedbar
	switch-window
	thingatpt
	undo-tree))

(dolist (p misc-packages)
  (require-package p))


;; ace jump configuration
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; dired+
(require 'dired)
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
(diredp-make-find-file-keys-reuse-dirs)
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")
(add-hook 'dired-load-hook
               (lambda ()
                 (load "dired-x")
                 ;; Set dired-x global variables here.  For example:
                 ))
(add-hook 'dired-mode-hook
               (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 (dired-omit-mode 1)
                 ))
(global-set-key (kbd "C-x C-d") 'ido-dired)


;; ediff
(setq ediff-split-window-function 'split-window-horizontally)


;; emms (emacs multi-media system)
(require 'emms-setup)
(require 'emms-info)
(require 'emms-info-mp3info)
(require 'emms-browser)
(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "/home/backup/Music")
(setq emms-info-functions '(emms-info-mp3info))
(add-hook 'emms-player-started-hook 'emms-show)
(global-set-key (kbd "s-e p") 'emms-play-directory)
(global-set-key (kbd "s-e e") 'emms)


;; eshell
(require 'eshell)
(setq eshell-prompt-function
      (lambda ()
	(concat
	 (user-login-name) "@" (getenv "HOSTNAME") ":" (eshell/pwd) "\n$ "))
      eshell-prompt-regexp "^$ ")


;; expand-region
(require 'expand-region)
(require 'web-mode-expansions)
(global-set-key (kbd "C-SPC") 'er/expand-region)


;; helm kill ring
(require 'helm)
(global-set-key (kbd "C-y") 'helm-show-kill-ring)


;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; ido
(require 'ido)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(global-set-key (kbd "C-<escape>") 'kill-this-buffer)


;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


;; org
(require 'org)
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-<tab>") 'switch-window)))


;; modeline config
(require 'smart-mode-line)
;(require 'smart-mode-line-powerline-theme)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/mode-width 'full)
(sml/apply-theme 'automatic)


;; projectile
(require 'projectile)
(projectile-global-mode)


;; resentf
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)


;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; speedbar
(require 'speedbar)
(global-set-key (kbd "s-y") 'speedbar)
(setq speedbar-show-unknown-files t)
(add-hook 'speedbar-mode-hook
	  (lambda ()
	    (auto-raise-mode 1)
	    (add-to-list 'speedbar-frame-parameters '(top . 30))
	    (add-to-list 'speedbar-frame-parameters '(left . 100))
	    (add-to-list 'speedbar-frame-parameters '(width . 30))
	    (add-to-list 'speedbar-frame-parameters '(height . 30))))


;; switch window configuration
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-<tab>") 'switch-window)

