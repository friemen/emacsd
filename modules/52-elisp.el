(defvar elisp-packages '(
	company
	nrepl-eval-sexp-fu
	paredit
	popup
	rainbow-delimiters
	smartparens))

(dolist (p elisp-packages)
  (require-package p))


(defun my-elisp-mode-hook ()
  (define-key emacs-lisp-mode-map (kbd "C-M-<") 'mc/mark-all-like-this)
  (define-key emacs-lisp-mode-map (kbd "C-<") 'mc/mark-all-symbols-like-this-in-defun)
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)
  (define-key emacs-lisp-mode-map (kbd "C-f") 'paredit-forward)
  (define-key emacs-lisp-mode-map (kbd "C-b") 'paredit-backward)
  (define-key emacs-lisp-mode-map (kbd "C-M-f") 'paredit-forward-down)
  (define-key emacs-lisp-mode-map (kbd "C-M-b") 'paredit-backward-up))


(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
