(provide 'my-newsticker)

(defun my-newsticker-close ()
  (kill-buffer "*Newsticker List*")
  (kill-buffer "*Newsticker Item*")
  (kill-buffer "*Newsticker Tree*"))

(use-package newsticker :ensure t
  :bind
  (("C-x C-z" . newsticker-show-news))
  :init
  (setq newsticker-url-list
        '(("Clojure News" "https://clojure.org/feed.xml")
          ("Linux News" "https://linuxnews.de/feed.rss")
          ("Spring News" "https://spring.io/blog.atom")
          ("Planet Emacslife" "https://planet.emacslife.com/atom.xml")
          ("Planet Clojure" "https://planet.clojure.in/atom.xml")
          ("r/emacs" "https://www.reddit.com/r/emacs.rss")
          ("r/Clojure" "https://www.reddit.com/r/Clojure.rss")
          ("heise online IT" "https://www.heise.de/rss/heise-Rubrik-IT-atom.xml")))

  (setq newsticker-dir "~/.emacs.d/localdata/newsticker")
  (advice-add 'newsticker-treeview-quit :after 'my-newsticker-close))
