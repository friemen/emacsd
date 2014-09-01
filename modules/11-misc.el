
(defvar misc-packages '(
	ace-jump-mode
	ace-jump-buffer
	; afternoon-theme
	auctex
	dired+
	dash
	emms
	flx-ido
	highlight
	ibuffer
	ido
	ido-ubiquitous
	;ido-vertical-mode
	impatient-mode
	magit
	markdown-mode
	multiple-cursors
	org
	popup
	powerline
	projectile
	smart-tab
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

; (load-theme 'afternoon t)

;; dired+
(require 'dired)
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
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


;; emms (emacs multi-media system)
(require 'emms-setup)
(emms-standard)
(emms-default-players)


;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; ido
(require 'ido)
;(require 'ido-vertical-mode)
(ido-mode t)
;(ido-vertical-mode 1)
(global-set-key (kbd "C-<escape>") 'ido-kill-buffer)


;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


;; powerline
(require 'powerline)
(powerline-default-theme)


;; projectile
(require 'projectile)
(projectile-global-mode)


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

