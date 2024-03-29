;;; init-flycheck --- Summary
;;; Commentary:
;;; Code:


(require 'projectile)
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq flycheck-idle-change-delay 0.5))



(defun dicridon-setup-flycheck-clang-project-path-canoe ()
  "Prepare project root for files in canoe project."
  (let ((root (ignore-errors (projectile-project-root ".")))
        (dirs '("src" "src/components")))
    (when root
      (let ((final (mapcar (lambda(c) (concat root c)) dirs)))
        (dolist (dir final)
          (add-to-list 'flycheck-clang-include-path dir))))))

(add-hook 'c++-mode-hook 'dicridon-setup-flycheck-clang-project-path-canoe)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))

(provide 'init-flycheck)
;;; init-flycheck ends here
