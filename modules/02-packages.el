

;; Auto installation of packages
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

(defvar my-packages '(
	ac-nrepl
	ace-jump-mode
	ace-jump-buffer
	auctex
	auto-complete
	cider
	clojure-cheatsheet
	clojure-mode
	clojure-test-mode
	clojure-project-mode
	clojurescript-mode
	dired+
	dash
	highlight
	ibuffer
	ido
	; ido-vertical-mode
	impatient-mode
	magit
	markdown-mode
	multiple-cursors
	nrepl-eval-sexp-fu
	org
	paredit
	popup
	powerline
	rainbow-delimiters
	smartparens
	smart-tab
	smex
	switch-window
	tabbar
	tabbar-ruler
	thingatpt
	undo-tree
	web-mode
))

(dolist (p my-packages)
  (require-package p))

