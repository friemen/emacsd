

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


;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; ido
(require 'ido)
; (require 'ido-vertical-mode)
(ido-mode t)
; (ido-vertical-mode 1)


;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


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


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


(require 'powerline)
(powerline-default-theme)
