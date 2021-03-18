;;; init-rust-mode --- Summary
;;; Commentary:
;;; Code:

(use-package rust-mode
  :ensure t
  :init
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(provide 'init-rust-mode)
;;; init-rust-mode ends here
