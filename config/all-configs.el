(provide 'all-configs)

(require 'my-clojure)
(require 'my-dashboard)
(require 'my-defaults)
(require 'my-dired)
(require 'my-elscreen)
(require 'my-elisp)
(require 'my-eshell)
(require 'my-highlight-symbol)
(require 'my-ibuffer)
(require 'my-ido)
(require 'my-js2)
(require 'my-magit)
(require 'my-markdown)
(require 'my-modeline)
(require 'my-neotree)
(require 'my-nxml)
(require 'my-org)
(require 'my-paredit)
(require 'my-projectile)
(require 'my-resize-window)
(require 'my-smex)
(require 'my-swiper)
(require 'my-themes)
(require 'my-web)
(require 'my-window-numbering)
(require 'all-keybindings)

;; required packages without individual configuration
(require-packages '(ace-jump-mode
		    ace-jump-buffer
		    browse-kill-ring
		    counsel
		    expand-region
		    impatient-mode
		    move-text
		    multiple-cursors
		    restclient
		    saveplace
		    switch-window))
