(provide 'my-neotree)
(require-packages '(neotree
		    projectile))

(setq neo-keymap-style 'concise
      neo-theme 'classic)

(setq neo-window-width 50)


(defun my-neotree-show ()
  "Change dir to current buffers project root if in a project."
  (interactive)
  (let ((filename (buffer-file-name))
	(project-root
	 (if (projectile-project-p)
	     (projectile-project-root)
	   nil)))

    (neotree-show)
    (when (and project-root
    	     (not (equal default-directory project-root)))
      (neotree-dir project-root)
      (when filename
	(search-forward (file-name-nondirectory filename) nil t)
	(beginning-of-line)))
    (when (>= (length window-numbering-windows) 2)
      (select-window-2)
      (select-window-1))))

(defun my-neotree-enter-hook (type path arg)
  "Hide neotree after loading file"
  (when (equal type 'file)
      (message "Hiding neotree after entering %s %s" path arg)
      (neotree-hide)))

(defun my-neotree-peek ()
  (interactive)
  (let ((neo-window (neo-global--get-window)))
    (remove-hook 'neo-enter-hook 'my-neotree-enter-hook)
    (neotree-enter)
    (add-hook 'neo-enter-hook 'my-neotree-enter-hook)
    (select-window neo-window)))

(add-hook 'neo-enter-hook #'my-neotree-enter-hook)

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (hl-line-mode)
	    (visual-line-mode 0)))

(defun my-show-mru ()
  (interactive)
  (message "%s" (get-mru-window)))
