(provide 'my-global-settings)

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
(setq scroll-margin 4)
(setq delete-by-moving-to-trash nil)



;; whitespace stripping
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)

;; how to deal with active region
(delete-selection-mode t)
(setq delete-active-region t)
;; disabling transient-mark-mode severly disturbs multiple-cursors *in-defun functions
;; (setq transient-mark-mode nil)

;; remember positions in visited files
(setq save-place-file (expand-file-name "saveplace" my-data-files-dir))
(save-place-mode 1)
;; remember last files visited
(setq recentf-save-file (expand-file-name "recentf" my-data-files-dir))
(recentf-mode 1)

;; no backup files, please
(setq backup-inhibited t)
;; but store file recovery data
(setq auto-save-list-file-prefix (expand-file-name "auto-save-list" my-data-files-dir))

;; save abbrev_defs in localdata dir
(setq abbrev-file-name (expand-file-name "abbrev_defs" my-data-files-dir))

;; support cut, copy, paste on C-x, C-c and C-v
(cua-mode)

;; make frame initially fullscreen
(toggle-frame-maximized)

;; no menu bar, no toolbar,
;; M-x menu-bar-mode and tool-bar-mode will toggle this
(menu-bar-mode 0)
(tool-bar-mode 0)

;; wrap long lines
;; (setq global-visual-line-mode t)
;; Don't visually wrap lines that do not fit in window
(setq-default truncate-lines t)

;; no scroll bars
(toggle-scroll-bar -1)

;; no blinking cursor
(blink-cursor-mode 0)

;; highlight other parens
(show-paren-mode t)

;; display line and column number in modeline
(column-number-mode 1)

;; set lighter background for current line
;; (global-hl-line-mode t)
;; (set-face-attribute 'hl-line nil :inherit nil :background "gray17")

;; how to display buffer names in modeline
(setq uniquify-buffer-name-style 'forward)

;; select help buffer, so typing q can kill it
(setq help-window-select t)

;; frame title
(setq frame-title-format "%b - Emacs")

;; ask before quitting emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;; extensions to be handled by xdg-open
(defvar my-xdg-open-file-extension-re
  (concat
   "\\.pdf"
   "\\|\\.docx\\|\\.doc\\|\\.xlsx\\|\\.xls\\|\\.pptx\\|\\.ppt"
   "\\|\\.odt\\|\\.ods\\|\\.odg\\|\\.odp"
   "\\|\\.vsd"
   "\\|\\.mkv\\|\\.m4v\\|\\.mp4\\|\\.mp3"
   "\\|\\.epgz"
   "\\|\\.qea\\|\\.feap"
   "\\|\\.xmind"))

;; use this with like
;; (font-lock-add-keywords 'clojure-mode my-todo-keywords)
(defconst my-todo-keywords
  '(("\\<\\(wip\\(?:(.*)\\)?:?\\)\\>"  1 'warning prepend)
    ("\\<\\(TODO\\(?:(.*)\\)?:?\\)\\>"  1 'warning prepend)
    ("\\<\\(FIXME\\(?:(.*)\\)?:?\\)\\>" 1 'error prepend)))

;; -------------------------------
;; idea: put this to a my-ediff file

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)

;; -------------------------------


(defun my-update-impatient-buffer ()
  (imp--on-change))

(add-hook 'after-revert-hook
          'my-update-impatient-buffer
          ;;#'imp--on-change nil t
          )
