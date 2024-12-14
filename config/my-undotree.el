(provide 'my-undotree)

(use-package undo-tree :ensure t
  :diminish

  :init
  (let ((map (make-sparse-keymap)))
    ;; remap `undo' and `undo-only' to `undo-tree-undo'
    (define-key map [remap undo] 'undo-tree-undo)
    (define-key map [remap undo-only] 'undo-tree-undo)
    ;; bind standard undo bindings (since these match redo counterparts)
    (define-key map (kbd "C-z") 'undo-tree-undo)
    ;; redo doesn't exist normally, so define our own keybindings
    (define-key map (kbd "C-S-z") 'undo-tree-redo)
    ;; just in case something has defined `redo'...
    (define-key map [remap redo] 'undo-tree-redo)
    ;; we use "C-x u" for the undo-tree visualizer
    (define-key map (kbd "C-x u") 'undo-tree-visualize)
    ;; bind register commands
    (define-key map (kbd "C-x r u") 'undo-tree-save-state-to-register)
    (define-key map (kbd "C-x r U") 'undo-tree-restore-state-from-register)
    ;; set keymap
    (setq undo-tree-map map))
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode))
