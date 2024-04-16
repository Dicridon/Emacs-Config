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

(defun load-modus-theme ()
    (load-theme 'modus-operandi-tinted t))

(defun load-modus-theme-daemon-hook (frame)
  (with-selected-frame frame
    (load-modus-theme)))

(if (daemonp)
    (add-hook 'after-make-frame-functions 'load-modus-theme-daemon-hook t)
  (load-modus-theme))

(global-hl-line-mode)
(provide 'init-theme)
;;; init-theme ends here
