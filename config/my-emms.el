(provide 'my-emms)
(require-package 'emms)

(require 'emms-setup)
(require 'emms-info)
(require 'emms-info-mp3info)
(require 'emms-browser)

(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music")
(setq emms-info-functions '(emms-info-mp3info))
(setq emms-player-mplayer-parameters nil)
(add-hook 'emms-player-started-hook 'emms-show)
