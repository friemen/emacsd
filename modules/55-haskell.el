(defvar haskell-packages '(
        company-ghc
	haskell-mode
	ghc
	shm
	popup))

(dolist (p haskell-packages)
  (require-package p))

(require 'company-ghc)
(require 'haskell-mode)
(require 'ghc)
(require 'shm)
(require 'popup)

;; make sure that your ~/.profile PATH setup includes ~/.cabal/bin


;;(add-hook 'haskell-mode-hook 'haskell-indent-mode)
;;(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
;;(add-hook 'haskell-mode-hook 'haskell-simple-indent-mode)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)


(add-hook 'haskell-interactive-mode-hook 'structured-haskell-repl-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)

(add-to-list 'company-backends 'company-ghc)


(defun ghc-show-info-popup ()
  (interactive)
  (popup-tip (ghc-get-info (ghc-things-at-point))
	     :around t :scroll-bar t))

(define-key haskell-mode-map (kbd "C-c C-d") 'ghc-show-info-popup)
