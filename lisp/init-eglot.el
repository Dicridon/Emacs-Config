;;; init --- Summary
;;; Commentary:
;;; Code:

(use-package eglot
  :ensure t
  :config
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1))))

(provide 'init-eglot)
;;; init-eglot ends here
