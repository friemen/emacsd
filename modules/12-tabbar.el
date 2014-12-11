
(defvar tabbar-packages '(
	tabbar
	tabbar-ruler))

(dolist (p tabbar-packages)
  (require-package p))


(require 'tabbar)
(require 'tabbar-ruler)
(tabbar-mode t)
;(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [C-prior] 'tabbar-backward-tab)
;(global-set-key [M-right] 'tabbar-forward-tab)
(global-set-key [C-next] 'tabbar-forward-tab)


(setq tabbar-background-color "#F6F8E3") ;; the color of the tabbar background


;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar

(defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to."
   (list
    (cond
     ((string-match "*cider-" (buffer-name))
      "REPL")
     ((string-match "*nrepl-" (buffer-name))
      "REPL")
     ((string-match "*ielm*" (buffer-name))
      "REPL")
     ((member (buffer-name)
	      '("*GNU Emacs*"
		"*Messages*"
		"*scratch*"
		"*helm*"
		"*Completions*"
		"*SPEEDBAR*"))
      "Emacs Buffer")
     ((string-match "*magit" (buffer-name))
      "Magit")
     (t "User Buffer"))))

