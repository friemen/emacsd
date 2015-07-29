(defvar clojure-packages '(
	ac-cider
	cider
	clj-refactor
	clojure-cheatsheet
	clojure-mode
	clojure-quick-repls
	nrepl-eval-sexp-fu
	paredit
	popup
	rainbow-delimiters
	smartparens
	typed-clojure-mode))

(dolist (p clojure-packages)
  (require-package p))

(require 'ac-cider)
(require 'clojure-mode)
(require 'cider)
(require 'nrepl-eval-sexp-fu)
(load (concat user-emacs-directory "cider-eval-sexp-fu.el"))
(require 'cider-eval-sexp-fu)
(require 'paredit)
(require 'clj-refactor)



(defun my-clojure-refactor-setup ()
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-v"))


(defun my-clojure-typed-setup ()
  (font-lock-add-keywords nil
			  '(("(\\(defn>\\)\\s-+\\(\\w+\\)"
			     (1 font-lock-keyword-face)
			     (2 font-lock-function-name-face))
			    ("(\\(defrecord>\\)\\s-+\\(\\w+\\)"
			     (1 font-lock-keyword-face)
			     (2 font-lock-function-name-face)))))


(defun my-refresh-om ()
  (interactive)
  (save-buffer)
  ;(cider-load-buffer)
  (cider-eval-defun-at-point)
  (cider-interactive-eval "(zackzack.demo.app/refresh)")
  ;(cider-interactive-eval "(de.doctronic.ms.frontend.app/refresh)")
  )


(defun my-delete-whitespace-except-one ()
  "Deletes all whitespace chars following point except one space."
  (interactive)
  (just-one-space -1))


(defun my-delete-region-or-char ()
  "Deletes a region if active, or the char after the point."
  (interactive)
  (if (use-region-p)
      (paredit-delete-region (region-beginning) (region-end))
    (paredit-forward-delete)))


(defun my-clojure-keybindings ()
     (define-key clojure-mode-map (kbd "C-ö") 'paredit-open-round)
     (define-key clojure-mode-map (kbd "C-ä") 'paredit-open-bracket)
     (define-key clojure-mode-map (kbd "C-ü") 'paredit-open-curly)
     (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
     (define-key clojure-mode-map (kbd "C-f") 'paredit-forward)
     (define-key clojure-mode-map (kbd "C-b") 'paredit-backward)
     (define-key paredit-mode-map (kbd "C-d") 'my-delete-whitespace-except-one)
     (define-key paredit-mode-map (kbd "C-M-f") 'paredit-forward-down)
     (define-key paredit-mode-map (kbd "<delete>") 'delete-region-or-char)
     (define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
     (define-key cider-repl-mode-map (kbd "C-c C-j") 'cider-javadoc)
     (define-key cider-repl-mode-map (kbd "C-c M-z") 'nrepl-make-connection-default)
     (define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
     (define-key cider-mode-map (kbd "C-c C-j") 'cider-javadoc)
     (define-key cider-mode-map (kbd "C-1") 'my-refresh-om))


(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'typed-clojure-mode)
(add-hook 'clojure-mode-hook 'my-clojure-refactor-setup)
(add-hook 'clojure-mode-hook 'my-clojure-typed-setup)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'subword-mode)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-mode-hook 'my-clojure-keybindings)

(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'my-clojure-keybindings)
(add-hook 'cider-repl-mode-hook 'my-clojure-refactor-setup)


(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))



(setq auto-mode-alist (cons '("\\.boot$" . clojure-mode) auto-mode-alist))
(setq cider-popup-stacktraces nil)
(setq nrepl-hide-special-buffers nil)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq nrepl-eval-sexp-fu-flash-duration 0.2)
(setq cider-eval-sexp-fu-flash-duration 0.2)
(setq clojure-quick-repls-cljs-setup
      "(require 'repltools)
       (repltools/cljs-repl)")
