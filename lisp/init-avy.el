;;; init-avy --- Summary
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-; c") 'avy-goto-char)
  (global-set-key (kbd "C-; l") 'avy-goto-line)
  (global-set-key (kbd "C-; w") 'avy-goto-word-1))

(provide 'init-avy)
;;; init-avy ends here
