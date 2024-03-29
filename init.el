(require 'package)


(defun require-package (pkg)
  "Installs package if it is not already installed"
  (when (not (package-installed-p pkg))
    (package-install pkg))
  (require pkg))

(defun require-packages (pkgs)
  (mapc 'require-package pkgs))

;; (setq url-proxy-services '(("http" . "YOUR-HOST:8080")))

(setq package-archives
      '(("MELPA"        . "https://melpa.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("NonGNU ELPA"  . "https://elpa.nongnu.org/nongnu/"))

      package-archive-priorities
      '(("MELPA"        . 10)
        ("MELPA Stable" . 5)
        ("GNU ELPA"     . 3)
        ("NonGNU ELPA"  . 2)))


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(server-start)

(add-to-list 'load-path (concat user-emacs-directory "config"))
(require-package 'use-package)

(setq my-data-files-dir "~/.emacs.d/localdata")
(require 'all-configs)


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
