;; Package-Requires: ((dash "2.18.1"))


(defun test-o-matic/fn-names ()
  "Returns a list a defn function names in the current buffer."
  (let* ((lines (list)))
    (save-excursion
      (goto-char (point-min))
      (while (not (eobp))
        (let* ((lb (line-beginning-position))
               (le (line-end-position))
               (ln (buffer-substring-no-properties lb le)))
          (save-match-data
            (when (string-match "^(defn \\([a-z0-9-_]*\\)" ln)
              (setq lines (append lines (list (match-string-no-properties 1 ln))))))
          (forward-line 1))))
    lines))


(defun test-o-matic/execute-ns ()
  (interactive)
  (let* ((fn-names (test-o-matic/fn-names))
         (form (concat "(de.doctronic.test-o-matic-client.core/execute-ns!"
                       " \"" (clojure-find-ns) "\" "
                       (apply 'concat (-interpose " "
                                                  (-map (lambda (s) (concat "\"" s "\""))
                                                        fn-names)))
                       ")")))
    (message form)
    (cider-nrepl-request:eval form
                              (cider-interactive-eval-handler nil nil)
                              "user" ;; always eval ns forms in the user namespace
                              nil
                              nil
                              nil
                              (cider-current-repl "clj" t))))


(defun test-o-matic/execute-fn ()
  (interactive)
  (let ((ns  (clojure-find-ns))
        (def (nth 1 (clojure-find-def))))

    (let ((form (concat "(de.doctronic.test-o-matic-client.core/execute-fn!"
                        " \"" (concat ns "/" def) "\")")))
      (message form)
      (cider-nrepl-request:eval form
                                (cider-interactive-eval-handler nil nil)
                                "user" ;; always eval ns forms in the user namespace
                                nil
                                nil
                                nil
                                (cider-current-repl "clj" t)))))
