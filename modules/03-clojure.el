;; Clojure configuration
(require 'clojure-mode)
(require 'ac-nrepl)
(require 'cider)
(require 'nrepl-eval-sexp-fu)
(load (concat user-emacs-directory "cider-eval-sexp-fu.el"))
(require 'cider-eval-sexp-fu)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)


(eval-after-load "auto-complete"
  '(progn
    (add-to-list 'ac-modes 'clojure-mode)
    (add-to-list 'ac-modes 'cider-mode)
    (add-to-list 'ac-modes 'cider-repl-mode)))


(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

(global-set-key (kbd "RET") 'newline-and-indent)
(setq cider-popup-stacktraces nil)
(setq nrepl-hide-special-buffers nil)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")


(setq nrepl-eval-sexp-fu-flash-duration 0.5)
(setq cider-eval-sexp-fu-flash-duration 0.5)

