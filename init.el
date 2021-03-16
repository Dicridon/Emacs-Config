;;; init --- Summary
;;; Commentary:
;;; Code:
(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(add-to-list 'load-path "~/.emacs.d/lisp/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(company-fuzzy dumb-jump treemacs ivy projectile switch-window smex go-mode rust-mode scala-mode flycheck-rust switch-window- ace-window neotree speedbar-git-respect company-c-headers company flycheck))
 '(safe-local-variable-values
   '((company-c-headers-path-user "./src/components/" "./components/")
     (company-clang-arguments "-I./src/components/" "-I./components/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'init-use-package)

(require 'init-company)
;; (require 'init-company-fuzzy)

(require 'init-flycheck)
(require 'init-flycheck-rust)
(require 'init-rust-mode)

(require 'init-smex)
(require 'init-avy)
(require 'init-switch-window)

(require 'init-projectile)
(require 'init-treemacs)

(require 'init-ivy)
(require 'init-avy)
(require 'dumb-jump)


(require 'init-customization)





(provide 'init)
;;; init ends here
