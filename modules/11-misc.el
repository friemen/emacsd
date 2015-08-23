(defvar misc-packages '(
	ace-jump-mode
	ace-jump-buffer
	auctex
	dired+
	dash
	ediff
	elscreen
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
	swiper
	switch-window
	thingatpt
	undo-tree))

(dolist (p misc-packages)
  (require-package p))



(global-set-key (kbd "C-<prior>") 'previous-buffer)
(global-set-key (kbd "C-<next>") 'next-buffer)


;; ace jump configuration
(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


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


;; elscreen
(require 'elscreen)
(setq elscreen-prefix-key (kbd "<C-f1>"))
(setq elscreen-display-screen-number 1)
(setq elscreen-display-tab nil)
(elscreen-start)


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


;; highlight
(global-set-key (kbd "C-+") 'hlt-highlight-symbol)
(global-set-key (kbd "C-#") 'hlt-unhighlight-symbol)
(setq hlt-auto-face-backgrounds '("Sky Blue" "Pink" "Gold" "Thistle"
				  "Green Yellow" "Light Salmon"))

;; hideshow
(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (define-key hs-minor-mode-map (kbd "C-c q q") 'hs-toggle-hiding)
	    (define-key hs-minor-mode-map (kbd "C-c q s") 'hs-show-block)
	    (define-key hs-minor-mode-map (kbd "C-c q h") 'hs-hide-block)
	    (define-key hs-minor-mode-map (kbd "C-c q C-s") 'hs-show-all)
	    (define-key hs-minor-mode-map (kbd "C-c q C-h") 'hs-hide-all)))

;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; ido
(require 'ido)
(require 'ido-vertical-mode)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-buffers '("\\` " "\\`*"))
(ido-vertical-mode 1)
(ido-mode t)
(defun my-ido-keys ()
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match))
(add-hook 'ido-setup-hook #'my-ido-keys)
(global-set-key (kbd "C-<escape>") 'kill-this-buffer)


;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-push-always-verify nil)

;; just use git push -v (and rely on the .git/config settings)
(defun magit-push-current (branch remote &optional remote-branch args)
  (interactive (magit-push-read-args t t))
  (magit-run-git-async-no-revert "push" "-v"))

(add-hook 'magit-mode-hook
	  (lambda ()
	    (define-key magit-mode-map (kbd "C-<tab>") 'switch-window)))


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


;; org
(require 'org)
(setq org-support-shift-select t)
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-<tab>") 'switch-window)))



;; modeline config
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/mode-width 'full)
(sml/apply-theme 'automatic)


;; projectile
(require 'projectile)
(projectile-global-mode)


;; recentf
(require 'recentf)
(defun ido-recentf-open ()
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
(global-set-key (kbd "C-x f") 'ido-recentf-open)


;; resize interactively
(defvar iresize-mode-map
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "<down>") 'enlarge-window)
    (define-key m (kbd "<up>") 'shrink-window)
    (define-key m (kbd "<left>") 'shrink-window-horizontally)
    (define-key m (kbd "<right>") 'enlarge-window-horizontally)
    (define-key m (kbd "C-c <end>") 'iresize-mode)
    m))

(define-minor-mode iresize-mode
  :initial-value nil
  :lighter " IResize"
  :keymap iresize-mode-map
  :group 'iresize)

(provide 'iresize)
(global-set-key (kbd "C-c <end>") 'iresize-mode)


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


;; swiper
(require 'swiper)
;; (ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)


;; switch window configuration
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-<tab>") 'switch-window)
