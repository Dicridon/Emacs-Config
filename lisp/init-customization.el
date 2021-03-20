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

;; colors
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 15)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:background ,(color-lighten-name bg 25)))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-annotation
     ((t (:inherit company-tooltip
                   :foreground "#FF9108"))))))
;; FF9108, CD770A
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-customization)
;;; init-customization ends here

