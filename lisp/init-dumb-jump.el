;;; init-dumb-jump --- Summary
;;; Commentary:
;;; Code:

(use-package dumb-jump
  :ensure t
  :init (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(provide 'init-dumb-jump)
;;; init-dumb-jump ends here
