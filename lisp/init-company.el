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
  (setq company-minimum-prefix-length 3)
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-backends (delete 'company-cmake company-backends))
  (setq company-c-headers-path-user '("." "./src" "./src/components"))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-company)
;;; init-company ends here
