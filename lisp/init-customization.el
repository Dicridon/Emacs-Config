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
(global-linum-mode t)

;;; bell
(setq ring-bell-function 'ignore)

(provide 'init-customization)
;;; init-customization ends here
