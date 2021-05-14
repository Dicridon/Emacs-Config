;;; init --- Summary
;;; Commentary:
;;; Code:
(use-package eglot
  :ensure t
  :config
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1))))

(defun projectile-project-find-function (dir)
  (let* ((root (projectile-project-root dir)))
    (and root (cons 'transient root))))

(with-eval-after-load 'project
  (add-to-list 'project-find-functions 'projectile-project-find-function))

(provide 'init-eglot)
;;; init-eglot ends here
