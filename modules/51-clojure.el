(defvar clojure-packages '(
	ac-nrepl
	cider
	clojure-cheatsheet
	clojure-mode
	clojure-test-mode
	company
	company-cider
	nrepl-eval-sexp-fu
	paredit
	popup
	rainbow-delimiters
	smartparens
	typed-clojure-mode))

(dolist (p clojure-packages)
  (require-package p))

(require 'ac-nrepl)
(require 'clojure-mode)
(require 'cider)
(require 'company)
(require 'company-cider)
(require 'nrepl-eval-sexp-fu)
(load (concat user-emacs-directory "cider-eval-sexp-fu.el"))
(require 'cider-eval-sexp-fu)
(require 'paredit)


(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'subword-mode)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'typed-clojure-mode)

(add-hook 'clojure-mode-hook
  '(lambda ()
     (font-lock-add-keywords nil
			     '(("(\\(defn>\\)\\s-+\\(\\w+\\)"
				(1 font-lock-keyword-face)
				(2 font-lock-function-name-face))))))


(add-hook 'cider-repl-mode-hook 'cider-mode)



(eval-after-load 'company
  '(add-to-list 'company-backends 'company-cider))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
     (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
     ))

; (define-key cider-mode-map (kbd "TAB") 'company-complete)

; (setq company-begin-commands '(self-insert-command))


(setq cider-popup-stacktraces nil)
(setq nrepl-hide-special-buffers nil)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")


(setq nrepl-eval-sexp-fu-flash-duration 0.2)
(setq cider-eval-sexp-fu-flash-duration 0.2)


