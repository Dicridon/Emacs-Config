;;; init-theme --- Summary
;;; Commentary:
;;; Code:
;;; (use-package sublime-themes
;;;   :ensure t
;;;   :config
;;;   (load-theme 'wilson))
(use-package modus-themes
  :ensure t
  :config)

(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)
(setq modus-themes-mixed-fonts t)
(load-theme 'modus-operandi-tinted t)

(global-hl-line-mode)
(provide 'init-theme)
;;; init-theme ends here
