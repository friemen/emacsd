

;; Auto installation of packages
(require 'package)

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)             

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

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
	ido
	magit
	markdown-mode
	multiple-cursors
	nrepl-eval-sexp-fu
	org
	paredit
	popup
	rainbow-delimiters
	smartparens
	smart-tab
	switch-window
	tabbar
	tabbar-ruler
	thingatpt
	undo-tree
	web-mode
))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
