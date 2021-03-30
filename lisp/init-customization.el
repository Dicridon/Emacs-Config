;;; init-customization --- Summary
;;; Commentary:
;;; Code:
;; Some customization
;;; parenthesis
(electric-pair-mode t)
(show-paren-mode t)

;;; indentation
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

;;; linum
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;;; bell
(setq ring-bell-function 'ignore)

;;; tool bar none
(tool-bar-mode -1)

;; colors, this is reserved for future use
;;(require 'color)
;;
;;(let ((bg (face-attribute 'default :background)))
;;  (custom-set-faces
;;   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
;;   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 15)))))
;;   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 10)))))
;;   `(company-tooltip-selection ((t (:background ,(color-lighten-name bg 25)))))
;;   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
;;   `(company-tooltip-annotation
;;     ((t (:inherit company-tooltip
;;                   :foreground "#FF9108"))))))
;; FF9108, CD770A

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-scrollbar-bg ((t (:background "#488848884888"))))
 '(company-scrollbar-fg ((t (:background "#3bbb3bbb3bbb"))))
 '(company-tooltip ((t (:inherit default :background "#3bbb3bbb3bbb"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "#FF9108"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:background "#622162216221")))))

;; No more yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Subword
(global-subword-mode)
(provide 'init-customization)
;;; init-customization ends here
