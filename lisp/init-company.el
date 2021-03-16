;;; init-company --- Summary
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :init
  (setq company-require-match nil)
  (setq company-tooltip-align-annotations t)
  (setq company-eclim-auto-save nil)
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-c-headers-path-user '("." "./src" "./src/components")))

(provide 'init-company)
;;; init-company ends here
