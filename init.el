

;; (setq url-proxy-services '(("http" . "YOUR-HOST:8080")))

;; turn off splash screen messages
(setq inhibit-startup-echo-area-message t
      inhibit-startup-screen t)
      
 
 
;;; LOAD MODULES
;;; All startup filenames begin with a number and get loaded in numerical order.

(mapc
 (lambda (filename) (load-file filename))
 (directory-files (concat user-emacs-directory "modules") t "[0-9]*.el"))

 
