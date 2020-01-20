;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:inherit mode-line :background ":background" :foreground "#ba8baf" :height 0.5))))
 '(hl-paren-face ((t nil)) t)
 '(line-number ((t (:background "gray100" :foreground "dark gray"))))
 '(line-number-current-line ((t (:background "black" :foreground "gray100"))))
 '(neo-banner-face ((t (:weight bold))))
 '(neo-button-face ((t (:background "#DC9656"))))
 '(neo-dir-link-face ((t (:foreground "#0b0b0b"))))
 '(neo-file-link-face ((t (:foreground "#0b0b0b"))))
 '(neo-root-dir-face ((t (:foreground "#8d8d84")))))


(add-to-list 'default-frame-alist '(left-fringe . 0))
  (add-to-list 'default-frame-alist '(right-fringe . 0))
  (add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
  (add-to-list 'default-frame-alist '(internal-border-width . 0))
  (add-to-list 'default-frame-alist '(width . 160))
  (add-to-list 'default-frame-alist '(height . 40))
  (setq ns-use-proxy-icon nil)
  (setq frame-title-format nil)
