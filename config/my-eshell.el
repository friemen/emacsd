(provide 'my-eshell)
(require-package 'eshell)

(setq eshell-prompt-function
      (lambda ()
	(concat
	 (user-login-name) "@" (getenv "HOSTNAME") ":" (eshell/pwd) "\n$ "))
      eshell-prompt-regexp "^$ ")
