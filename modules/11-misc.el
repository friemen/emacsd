(defvar misc-packages '(
	ace-jump-mode
	ace-jump-buffer
;	auctex
	browse-kill-ring
	counsel
	dired+
	dash
	ediff
	elscreen
	emms
	eshell
	expand-region
	flx-ido
	gandalf-theme
	highlight
	ibuffer
	ido
	ido-ubiquitous
	crm-custom
	ido-vertical-mode
	impatient-mode
	magit
	markdown-mode
	move-text
	multiple-cursors
	neotree
	org
	popup
	projectile
	recentf
	saveplace
	smart-tab
	smart-mode-line
	smart-mode-line-powerline-theme
	smex
	swiper
	switch-window
	thingatpt
	undo-tree
	window-numbering))

(dolist (p misc-packages)
  (require-package p))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general key bindings

(global-set-key (kbd "C-<prior>") 'previous-buffer)
(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<escape>") 'kill-this-buffer)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace jump configuration
(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; counsel
(require 'counsel)
(global-set-key (kbd "C-w") 'counsel-git-grep)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
                 (dired-omit-mode 1)))
(global-set-key (kbd "C-x C-d") 'ido-dired)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ediff
(setq ediff-split-window-function 'split-window-horizontally)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elscreen
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-c C-s"))
(setq elscreen-display-screen-number 1)
(setq elscreen-display-tab nil)
(elscreen-start)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emms (emacs multi-media system)
(require 'emms-setup)
(require 'emms-info)
(require 'emms-info-mp3info)
(require 'emms-browser)
(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music")
(setq emms-info-functions '(emms-info-mp3info))
(add-hook 'emms-player-started-hook 'emms-show)
(global-set-key (kbd "s-e p") 'emms-play-directory)
(global-set-key (kbd "s-e e") 'emms)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eshell
(require 'eshell)
(setq eshell-prompt-function
      (lambda ()
	(concat
	 (user-login-name) "@" (getenv "HOSTNAME") ":" (eshell/pwd) "\n$ "))
      eshell-prompt-regexp "^$ ")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; expand-region
(require 'expand-region)
(require 'web-mode-expansions)
(global-set-key (kbd "C-SPC") 'er/expand-region)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; browse kill ring
(require 'browse-kill-ring)
(global-set-key (kbd "C-y") 'browse-kill-ring)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight
(global-set-key (kbd "C-+") 'hlt-highlight-symbol)
(global-set-key (kbd "C-#") 'hlt-unhighlight-symbol)
(setq hlt-auto-face-backgrounds '("Sky Blue" "Pink" "Gold" "Thistle"
				  "Green Yellow" "Light Salmon"))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hideshow
(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (define-key hs-minor-mode-map (kbd "C-c q q") 'hs-toggle-hiding)
	    (define-key hs-minor-mode-map (kbd "C-c q s") 'hs-show-block)
	    (define-key hs-minor-mode-map (kbd "C-c q h") 'hs-hide-block)
	    (define-key hs-minor-mode-map (kbd "C-c q C-s") 'hs-show-all)
	    (define-key hs-minor-mode-map (kbd "C-c q C-h") 'hs-hide-all)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (visual-line-mode 0)
	    (toggle-truncate-lines t)
	    (ibuffer-do-sort-by-filename/process)
	    (hl-line-mode)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido
(require 'ido)
(require 'ido-vertical-mode)
(require 'ido-ubiquitous)
(require 'crm-custom)
(setq ido-enable-flex-matching t)
(setq ido-everywhere 1)
(setq ido-ignore-buffers '("\\` " "\\`*"))
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(ido-mode t)
(defun my-ido-keys ()
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match))
(add-hook 'ido-setup-hook #'my-ido-keys)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; move-text

(global-set-key (kbd "M-S-<up>") 'move-text-up)
(global-set-key (kbd "M-S-<down>") 'move-text-down)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org
(require 'org)
(setq org-support-shift-select t)
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-<tab>") 'switch-window)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modeline config
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/mode-width 'full)
(sml/apply-theme 'automatic)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; neotree
(require 'neotree)
(setq neo-keymap-style 'concise
      neo-theme 'classic)

(defun my-neotree-show ()
  "Change dir to current buffers project root if in a project."
  (interactive)
  (let ((filename (buffer-file-name))
	(project-root
	 (if (projectile-project-p)
	     (projectile-project-root)
	   nil)))

    (neotree-show)
    (when (and project-root
    	     (not (equal default-directory project-root)))
      (neotree-dir project-root)
      (when filename
	(search-forward (file-name-nondirectory filename) nil t)
	(beginning-of-line)))
    (when (>= (length window-numbering-windows) 2)
      (select-window-2)
      (select-window-1))))

(defun my-neotree-enter-hook (type path arg)
  (message path)
  (if (equal type 'file)
      ;; hide neotree after loading file
      (neotree-hide)))

(defun my-neotree-peek ()
  (interactive)
  (let ((neo-window (neo-global--get-window)))
    (remove-hook 'neo-enter-hook 'my-neotree-enter-hook)
    (neotree-enter)
    (add-hook 'neo-enter-hook 'my-neotree-enter-hook)
    (select-window neo-window)))

(add-hook 'neo-enter-hook #'my-neotree-enter-hook)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key neotree-mode-map (kbd "C") 'neotree-change-root)
	    (define-key neotree-mode-map (kbd "c") 'neotree-create-node)
	    (define-key neotree-mode-map (kbd "d") 'neotree-delete-node)
	    (define-key neotree-mode-map (kbd "r") 'neotree-rename-node)
	    (define-key neotree-mode-map (kbd "e") 'neotree-enter)
	    (define-key neotree-mode-map (kbd "C-g") 'neotree-hide)
	    (define-key neotree-mode-map (kbd "SPC") 'my-neotree-peek)
	    (hl-line-mode)
	    (visual-line-mode 0)))

(global-set-key (kbd "C-q") 'my-neotree-show)


(defun my-show-mru ()
  (interactive)
  (message "%s" (get-mru-window)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-switch-project-action 'my-neotree-show)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching)
(setq projectile-globally-ignored-files '( ".#*" "#*#" "/target/"))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; recentf
(require 'recentf)
(defun my-ido-recentf-open ()
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
(global-set-key (kbd "C-x f") 'my-ido-recentf-open)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; swiper
(require 'swiper)
;; (ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; switch window configuration
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-<tab>") 'switch-window)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window numbering using M-1 M-2 ...
(require 'window-numbering)
(window-numbering-mode 1)
