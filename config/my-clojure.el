(provide 'my-clojure)

(require-packages '(cider
		    cider-eval-sexp-fu
		    company
		    ;company-quickhelp
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

(require 'my-paredit)


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

(defun my-clojure-restart-system ()
  (interactive)
  (cider-interactive-eval "(user/system-restart!)"))


(defun my-clojure-cider-popup-doc ()
  "A popup alternative to `cider-doc'."
  (interactive)
  (let ((doc-buffer (cider-create-doc-buffer (symbol-name (symbol-at-point)))))
    (popup-tip (save-current-buffer
		 (set-buffer doc-buffer)
		 (buffer-string))
     :point (cider-completion-symbol-start-pos)
     :around t
     :scroll-bar t
     :margin t)))



;; Evaluate form within (comment) sexp

(defun my-clojure-eval-region-or-last-sexp-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (if (region-active-p)
          (let ((log-size message-log-max))
            (setq message-log-max nil)
            (cider-insert-region-in-repl (region-beginning)
                                         (region-end))
            (setq message-log-max log-size))

        (cider-insert-last-sexp-in-repl))
      (cider-repl-return))))


(defun my-clojure-eval-form ()
  (interactive)
  (save-excursion
    (my-goto-end-of-form)
    (cider-eval-last-sexp)))


(defun my-clojure-eval-form-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
         (my-goto-end-of-form)
      (my-eval-region-or-last-sexp-in-repl))))


(defun my-clojure-indent-defn ()
  (interactive)
  (save-excursion
    (goto-char (my-beginning-of-form))
    (indent-sexp)
    (clojure-align (point) (my-end-of-form))))


;; save form and eval saved form

(defvar my-clojure-saved-ns)
(defvar my-clojure-saved-sexp)

(defun my-clojure-save-form ()
  (interactive)
  (my-goto-end-of-form)
  (setq my-clojure-saved-ns (cider-current-ns))
  (setq my-clojure-saved-sexp (cider-last-sexp))
  (message "%s" my-clojure-saved-sexp))


(defun my-clojure-eval-saved-form ()
  (interactive)
  (message "Eval saved sexp")
  (when my-clojure-saved-sexp
    (let* ((current-ns (cider-current-ns))
	   (form (concat "(do (ns " my-clojure-saved-ns ")"
			 "    (let [result " my-clojure-saved-sexp "]"
			 "      (ns " current-ns ")"
			 "      result))")))
      (cider-interactive-eval form))))


;; install hooks

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'typed-clojure-mode)
(add-hook 'clojure-mode-hook 'my-clojure-refactor-setup)
(add-hook 'clojure-mode-hook 'my-clojure-typed-setup)
(add-hook 'clojure-mode-hook 'hs-minor-mode)

(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'subword-mode)
(add-hook 'cider-mode-hook 'highlight-symbol-mode)

(add-hook 'cider-repl-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'my-clojure-refactor-setup)
(add-hook 'cider-repl-mode-hook 'highlight-symbol-mode)


(setq auto-mode-alist (cons '("\\.boot$" . clojure-mode) auto-mode-alist))
(setq cider-ovelays-use-font-lock t)
(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-popup-stacktraces nil)
(setq nrepl-hide-special-buffers nil)
(setq cider-prompt-for-project-on-connect nil)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq nrepl-eval-sexp-fu-flash-duration 0.2)
(setq cider-eval-sexp-fu-flash-duration 0.2)
(setq cider-cljs-lein-repl "(user/cljs-repl)")
(setq cider-mode-line-show-connection t)
(cider-repl-toggle-pretty-printing)
