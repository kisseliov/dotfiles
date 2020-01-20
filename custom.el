;; This file is used for the built-in customization UI in Emacs (M-x customize)
;; This file will not be affected by Castlemacs updates
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote bar))
 '(package-selected-packages
   (quote
    (emmet-mode web-mode markdown-mode haml-mode yaml-mode define-word powerthesaurus flyspell-correct-popup flyspell-correct company shell-pop git-gutter magit counsel-projectile ivy-rich avy flx smex counsel swiper ivy projectile multiple-cursors visual-regexp move-text expand-region which-key vi-tilde-fringe neotree rich-minority smartparens all-the-icons undo-tree simpleclip exec-path-from-shell use-package)))
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-universal-key "s-=")
 '(underline-minimum-offset 4)
 '(x-use-underline-position-properties t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#fafafa" :width extra-expanded))))
 '(sp-show-pair-match-face ((t (:underline t)))))
