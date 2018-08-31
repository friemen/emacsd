(provide 'my-highlight-symbol)

(setq highlight-symbol-colors '("Sky Blue" "Pink" "Gold" "Thistle"
 				  "Green Yellow" "Light Salmon"))
(setq highlight-symbol-idle-delay 0.7)
(setq highlight-symbol-should-auto-highlight-p 1)


(defun highlight-symbol-count ()
  ;; intentionally do nothing
  ;; so that "n occurrences in buffer" doesn't replace useful infos in minibuffer
  )
