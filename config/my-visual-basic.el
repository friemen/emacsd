(provide 'my-visual-basic)

;; visual basic support is not available in any repo, use copy from EmacsWiki
(add-to-list 'load-path (concat user-emacs-directory "emacswiki/visual-basic"))

(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(push '("\\.\\(?:frm\\|\\(?:ba\\|cl\\|vb\\)s\\)\\'" . visual-basic-mode)
        auto-mode-alist)
