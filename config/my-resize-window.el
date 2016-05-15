(provide 'my-resize-window)

(defvar my-resize-window-mode-map
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "<down>") 'enlarge-window)
    (define-key m (kbd "<up>") 'shrink-window)
    (define-key m (kbd "<left>") 'shrink-window-horizontally)
    (define-key m (kbd "<right>") 'enlarge-window-horizontally)
    (define-key m (kbd "C-c <end>") 'my-resize-window-mode)
    m))

(define-minor-mode my-resize-window-mode
  :initial-value nil
  :lighter " my-resize-window"
  :keymap my-resize-window-mode-map
  :group 'my-resize-window)
