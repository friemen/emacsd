(defvar clojure-packages '(
	cider
	cider-eval-sexp-fu
	company
	company-quickhelp
	clj-refactor
	clojure-cheatsheet
	clojure-mode
	clojure-quick-repls
	nrepl-eval-sexp-fu
	paredit
	paxedit
	popup
	rainbow-delimiters
	smartparens
	typed-clojure-mode))

(dolist (p clojure-packages)
  (require-package p))

(require 'company)
(require 'company-quickhelp)
(require 'clojure-mode)
(require 'cider)
(require 'cider-eval-sexp-fu)
(require 'nrepl-eval-sexp-fu)
(require 'paredit)
(require 'paxedit)
(require 'clj-refactor)

(company-quickhelp-mode 1)

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


(defun my-restart-system ()
  (interactive)
  (cider-interactive-eval "(user/system-restart!)"))


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


(defun my-cider-popup-doc ()
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


(defun my-indent-and-complete-symbol ()
  (interactive)
  (let ((pos (point)))
    (lisp-indent-line)
    (when (= pos (point))
      (if (save-excursion (re-search-backward "[^() \n\t\r]+\\=" nil t))
	  (company-complete)))))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evaluate form within (comment) sexp
;; Courtesy of Minh Hemmer

(defun my-goto-end-of-form-rec (p)
  (let ((next-pos (paxedit-sexp-move-to-core-start)))
    (cond ((looking-at ".comment")
           (progn (message "commment")
                  (goto-char p)
                  (paredit-forward)))

          ((numberp next-pos)
           (my-goto-end-of-form-rec next-pos))

          (t
           (paredit-forward)))))

(defun my-goto-end-of-form ()
  (interactive)
  (my-goto-end-of-form-rec (point)))

(defun my-end-of-form ()
  (save-excursion
    (my-goto-end-of-form)
    (point)))

(defun my-beginning-of-form ()
  (save-excursion
    (my-goto-end-of-form)
    (paredit-backward)
    (point)))

(defun my-eval-region-or-last-sexp-in-repl ()
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


(defun my-eval-form ()
  (interactive)
  (save-excursion
    (my-goto-end-of-form)
    (cider-eval-last-sexp)))


(defun my-eval-form-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (my-goto-end-of-form)
      (my-eval-region-or-last-sexp-in-repl))))


(define-eval-sexp-fu-flash-command my-eval-form
  (eval-sexp-fu-flash (cons (my-beginning-of-form) (my-end-of-form))))

(define-eval-sexp-fu-flash-command my-eval-region-or-last-sexp-in-repl
  (eval-sexp-fu-flash (cons (save-excursion (paredit-backward) (point)) (point))))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defvar my-saved-ns)
(defvar my-saved-sexp)

(defun my-save-form ()
  (interactive)
  (my-goto-end-of-form)
  (setq my-saved-ns (cider-current-ns))
  (setq my-saved-sexp (cider-last-sexp))
  (message "%s" my-saved-sexp))


(defun my-eval-saved-form ()
  (interactive)
  (message "Eval saved sexp")
  (when my-saved-sexp
    (let* ((current-ns (cider-current-ns))
	   (form (concat "(do (ns " my-saved-ns ")"
			 "    (let [result " my-saved-sexp "]"
			 "      (ns " current-ns ")"
			 "      result))")))
      (cider-interactive-eval form))))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-clojure-keybindings ()
  (define-key clojure-mode-map (kbd "C-1") 'paredit-open-round)
  (define-key clojure-mode-map (kbd "C-2") 'paredit-open-bracket)
  (define-key clojure-mode-map (kbd "C-3") 'paredit-open-curly)
  (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
  (define-key clojure-mode-map (kbd "TAB") 'my-indent-and-complete-symbol)
  (define-key clojure-mode-map (kbd "C-f") 'paredit-forward)
  (define-key clojure-mode-map (kbd "C-b") 'paredit-backward)
  (define-key clojure-mode-map (kbd "C-M-<") 'mc/mark-all-like-this)
  (define-key clojure-mode-map (kbd "C-<") 'mc/mark-all-symbols-like-this-in-defun)
  (define-key clojure-mode-map (kbd "C-c <C-return>") 'my-restart-system)
  (define-key paredit-mode-map (kbd "C-d") 'my-delete-whitespace-except-one)
  (define-key paredit-mode-map (kbd "C-M-f") 'paredit-forward-down)
  (define-key paredit-mode-map (kbd "<delete>") 'my-delete-region-or-char)
  (define-key cider-repl-mode-map (kbd "C-1") 'paredit-open-round)
  (define-key cider-repl-mode-map (kbd "C-2") 'paredit-open-bracket)
  (define-key cider-repl-mode-map (kbd "C-3") 'paredit-open-curly)
  (define-key cider-repl-mode-map (kbd "{") 'paredit-open-curly)
  (define-key cider-repl-mode-map (kbd "C-c C-d") 'my-cider-popup-doc)
  (define-key cider-repl-mode-map (kbd "C-c C-j") 'cider-javadoc)
  (define-key cider-repl-mode-map (kbd "C-c M-z") 'nrepl-make-connection-default)
  (define-key cider-repl-mode-map (kbd "TAB") 'my-indent-and-complete-symbol)
  (define-key cider-repl-mode-map (kbd "C-c <C-return>") 'my-restart-system)
  (define-key cider-mode-map (kbd "C-c C-d") 'my-cider-popup-doc)
  (define-key cider-mode-map (kbd "C-c C-j") 'cider-javadoc)
  (define-key cider-mode-map (kbd "C-c C-c") 'my-eval-form)
  (define-key cider-mode-map (kbd "C-c l") 'my-save-form)
  (define-key cider-mode-map (kbd "C-c C-l") 'my-eval-saved-form)
  (define-key cider-mode-map (kbd "C-c M-p") 'my-eval-form-in-repl)
  (define-key cider-mode-map (kbd "<C-dead-circumflex>") 'my-refresh-om))


(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'typed-clojure-mode)
(add-hook 'clojure-mode-hook 'my-clojure-refactor-setup)
(add-hook 'clojure-mode-hook 'my-clojure-typed-setup)
(add-hook 'clojure-mode-hook 'hs-minor-mode)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'subword-mode)
(add-hook 'cider-mode-hook 'my-clojure-keybindings)
(add-hook 'cider-mode-hook 'highlight-symbol-mode)

(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'my-clojure-keybindings)
(add-hook 'cider-repl-mode-hook 'my-clojure-refactor-setup)
(add-hook 'cider-mode-hook 'highlight-symbol-mode)

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
(setq clojure-quick-repls-cljs-setup
      "(user/cljs-repl)")
