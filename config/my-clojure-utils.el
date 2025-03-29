(provide 'my-clojure-utils)

(require 'my-lisp-utils)
(require 'my-company)
(require 'cider-util)

(defun my-clojure-restart-system ()
  (interactive)
  (cider-interactive-eval "(user/system-restart!)"))

(defun my-clojure-figwheel-start ()
  (interactive)
  (cider-insert-in-repl "(user/fig-init)" t))

(defun my-clojure-figwheel-repl ()
  (interactive)
  (cider-insert-in-repl "(user/fig-repl)" t))

(defun my-clojure-cljs-repl-quit ()
  (interactive)
  (cider-insert-in-repl ":cljs/quit" t))

(defun my-clojure-refresh-namespaces ()
  (interactive)
  (cider-interactive-eval "(do (require '[clojure.tools.namespace.repl :as tn])
                               (tn/refresh-all))"))

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

(defun my-clojure-clear-repl ()
  (interactive)
  (cider-find-and-clear-repl-output t))


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
      (my-clojure-eval-region-or-last-sexp-in-repl))))

(defun my-clojure-insert-defun-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (my-goto-end-of-form)
      (cider-insert-last-sexp-in-repl))))

(defun my-clojure-indent-defn ()
  (interactive)
  (save-excursion
    (goto-char (my-beginning-of-form))
    (indent-sexp)
    (clojure-align (point) (my-end-of-form))))

(defun my-clojure-indent-then-complete ()
  (interactive)
  (my-company-indent-then-complete #'lisp-indent-line))

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

(defun my-clojure-namespace-to-clipboard ()
  (interactive)
  (let ((ns (cider-get-ns-name)))
    (kill-new ns)
    (message "Copied to clipboard: %s" ns)))
