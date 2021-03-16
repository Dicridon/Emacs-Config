;;; init-projectile --- Summary
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-root-functions '(projectile-root-top-down-recurring
                                            projectile-root-local
                                            projectile-root-bottom-up
                                            projectile-root-top-down))
  (projectile-register-project-type 'canoe '(".canoe")
                                    :project-file "config.json"
                                    :compile "canoe build"
                                    :run "canoe run"))

(provide 'init-projectile)
;;; init-projectile ends here
