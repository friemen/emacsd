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
