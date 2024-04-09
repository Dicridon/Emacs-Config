;;; init --- Summary
;;; Commentary:
;;; Code:

(add-hook 'rust-mode-hook 'eglot-ensure)

;; (use-package flycheck-rust
  ;; :ensure t
  ;; :config
  ;; (with-eval-after-load 'rust-mode
  ;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)
;;; init-rust ends here
