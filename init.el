(package-initialize)

;; (setq url-proxy-services '(("http" . "YOUR-HOST:8080")))

(server-start)

;;; LOAD MODULES
;;; All startup filenames begin with a number and get loaded in numerical order.

(mapc
 (lambda (filename) (load-file filename))
 (directory-files (concat user-emacs-directory "modules") t "[0-9]*.el"))


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (shm company-ghc flycheck web-mode js2-mode typed-clojure-mode rainbow-delimiters paxedit nrepl-eval-sexp-fu clojure-quick-repls clojure-cheatsheet clj-refactor company-quickhelp company cider-eval-sexp-fu cider undo-tree switch-window smex smart-mode-line-powerline-theme smart-mode-line smart-tab projectile popup neotree multiple-cursors move-text markdown-mode magit impatient-mode ido-vertical-mode crm-custom ido-ubiquitous highlight gandalf-theme flx-ido expand-region emms elscreen dired+ counsel browse-kill-ring auctex ace-jump-buffer ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
