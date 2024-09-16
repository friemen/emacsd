(provide 'my-clojure)

(use-package clj-refactor :ensure t
  :diminish
  :bind
  (:map clojure-mode-map
        ("C-c C-r" . hydra-cljr-help-menu/body))
  :config
  (cljr-add-keybindings-with-prefix "C-c C-v"))


(defun my-clj-refactor-setup ()
    (clj-refactor-mode 1))


(use-package cider :ensure t
  :bind
  (:map cider-mode-map
        ("RET" . nil)
        ("C-j" . paredit-RET)
        ("C-c C-c" . my-clojure-eval-form)
        ("C-c C-p" . my-clojure-refresh-namespaces)
        ("C-c s" . my-clojure-restart-system)
        ("C-c f" . my-clojure-figwheel-start)
        ("C-c r" . my-clojure-figwheel-repl)
        ("C-c q" . my-clojure-cljs-repl-quit)
        ("C-c C-d" . my-clojure-cider-popup-doc)
        ("C-c C-f" . my-clojure-eval-form-in-repl)
        ("C-c l" . my-clojure-save-form)
        ("C-c C-l" . my-clojure-eval-saved-form)
        ("C-c C-i" . my-clojure-indent-defn)
        ("C-c C-x" . my-clojure-clear-repl))

  :config
  (setq cider-overlays-use-font-lock t)
  (setq cider-font-lock-dynamically '(macro core function var))
  (setq cider-popup-stacktraces nil)
  ;; (setq cider-default-cljs-repl "(user/fig-repl)")
  (setq cider-default-cljs-repl nil)
  (setq cider-repl-auto-detect-type t)
  (setq cider-mode-line-show-connection t)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-print-fn 'fipp)
  (setq cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
  (setq cider-repl-display-help-banner nil)
  (setq cider-prompt-for-symbol nil)
  (setq cider-save-file-on-load nil)
  (setq nrepl-repl-buffer-name-template "*cider-repl %s(%r:%S)*")
  (setq cider-session-name-template "%j:%h")
  (setq cider-test-fail-fast nil)

  (require 'my-clojure-utils)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'cider-mode)
  (add-hook 'cider-repl-mode-hook 'my-clj-refactor-setup)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook 'prettify-symbols-mode)
  (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook 'highlight-symbol-mode)
  (add-hook 'cider-repl-mode-hook 'yas-minor-mode)
  )

(use-package clojure-mode :ensure t
  :bind
  (:map paredit-mode-map
        ("RET" . nil)
        ("C-j" . paredit-RET)
        ("C-c C-i" . my-clojure-indent-defn)
        :map clojure-mode-map
        ("C-M-." . mc/mark-all-symbols-like-this)
        ("C-." . mc/mark-all-symbols-like-this-in-defun))

  :config
  ;;(message "Started CLOJURE MODE")
  ;;(require 'clojure-mode-expansions)
  ;;(add-hook 'clojure-mode-hook 'er/add-clojure-mode-expansions)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'clojure-mode-hook 'my-clj-refactor-setup)
  (add-hook 'clojure-mode-hook 'hs-minor-mode)
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'clojure-mode-hook 'company-mode)
  (add-hook 'clojure-mode-hook 'prettify-symbols-mode)
  (add-hook 'clojure-mode-hook 'subword-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'highlight-symbol-mode)

  (font-lock-add-keywords 'clojure-mode my-todo-keywords)
  (font-lock-add-keywords 'clojurec-mode my-todo-keywords)
  (font-lock-add-keywords 'clojurescript-mode my-todo-keywords)

  (define-clojure-indent
    (defroutes 'defun)
    (match 'defun)
    (for-all 'defun)
    (letk 'defun)
    (specify 'defun)
    (specify! 'defun)
    (fnk 'defun)
    (defnk 'defun)
    (set-env! 'defun)
    (get-env 'defun)
    (lazy-seq'defun)
    (system-map 'defun)
    (describe 'defun)
    (it 'defun)
    (facts 'defun)
    (fact 'defun)
    (future-facts 'defun)
    (future-fact 'defun)
    (render 'defun)
    (ident 'defun)
    (q/render 'defun)
    (will-update 'defun)
    (did-update 'defun)
    (did-mount 'defun)
    (will-unmount 'defun)
    (render-state 'defun)
    (init-state 'defun)
    (will-mount 'defun)
    (input 'defun)
    (go 'defun)
    (form 'defun)
    (let-routes 'defun)
    (html 'defun)
    (doall 'defun)
    (dosync 'defun)

    ;; Compojure
    (GET 'defun)
    (PUT 'defun)
    (POST 'defun)
    (DELETE 'defun)
    (ANY 2)
    (routes 'defun)
    (context 'defun)
    (add-watch 'defun)
    (listen! 'defun)

    ;; Om Next
    (query 'defun)
    (params 'defun)
    (add-root! 'defun)
    (should-update 'defun)
    (componentWillMount 'defun)
    (componentDidMount 'defun)
    (componentDidUpdate 'defun)
    (componentWillUnmount 'defun)
    (componentWillUpdate 'defun)
    (shouldComponentUpdate 'defun)

    ;; Reframe
    (register-handler 'defun)
    (register-sub 'defun)
    (reg-sub 'defun)
    (reg-event-fx 'defun)
    (reg-event-db 'defun)
    (reg-cofx 'defun)
    (reg-fx 'defun)
    )
  )
