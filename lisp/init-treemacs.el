;;; init-treemacs --- Summary
;;; Commentary:
;;; Code:

(use-package treemacs
  :ensure t
  :bind (("C-c e e" . treemacs)
         ("C-c e x" . treemacs-display-current-project-exclusively)
         ("C-c e s" . treemacs-switch-workspace))
  :config
  (setq treemacs-no-png-images t))

(provide 'init-treemacs)
;;; init-treemacs ends here
