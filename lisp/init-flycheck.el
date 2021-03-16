;;; init-flycheck --- Summary
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq flycheck-clang-include-path
        (list "./src/" "./src/components/" "./components/")))
(provide 'init-flycheck)
;;; init-flycheck ends here
