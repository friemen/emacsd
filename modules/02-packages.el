;; support for installation of packages
(require 'package)

(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun require-package (pkg)
  "Installs package if it is not already installed"
  (when (not (package-installed-p pkg))
    (package-install pkg)))
