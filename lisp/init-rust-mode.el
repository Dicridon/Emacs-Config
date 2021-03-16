;;; init-rust-mode --- Summary
;;; Commentary:
;;; Code:

(use-package rust-mode
  :ensure t
  :init
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust-mode)
;;; init-rust-mode ends here
