(provide 'my-projectile)
(require-packages '(projectile))

(projectile-global-mode)
(setq projectile-switch-project-action 'my-neotree-show)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-globally-ignored-directories
      (append '( "out" "target" ".cljs_rhino_repl" ".git")
	      projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
      (append '( ".#*" "#*#")
	      projectile-globally-ignored-files))