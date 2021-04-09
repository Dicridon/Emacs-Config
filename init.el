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
 '(custom-safe-themes
   '("b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" default))
 '(package-selected-packages
   '(markdown-mode company-auctex latex-preview-pane auctex paredit company-fuzzy treemacs-projectile linum-relative flycheck-rust window-numbering eglot-jl enh-ruby-mode robe zenity-color-picker sublime-themes dumb-jump treemacs ivy projectile switch-window smex go-mode rust-mode scala-mode switch-window- ace-window neotree speedbar-git-respect company-c-headers company flycheck))
 '(safe-local-variable-values
   '((company-c-headers-path-user "./src/components/" "./components/")
     (company-clang-arguments "-I./src/components/" "-I./components/"))))

(require 'init-use-package)
(require 'init-projectile)
(require 'init-treemacs)


(require 'init-company)
(require 'init-flycheck)
(require 'init-smex)
(require 'init-avy)
(require 'init-switch-window)

(require 'init-ivy)
(require 'init-avy)
(require 'init-dumb-jump)

(require 'init-org-mode)
;;(if (display-graphic-p)
(require 'init-theme)

(require 'init-latex)

;; language specific
(require 'init-eglot)
(require 'init-ruby)
(require 'init-rust)
(require 'init-go)
(require 'init-elisp)

;; customizations
(require 'init-customization)
(require 'init-window-numbering)
(provide 'init)
;;; init ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
