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
   '("c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "a4395e069de3314001de4e139d6a3b1a83dcf9c3fdc68ee7b13eef6c2cba4ae3" "c9415c9f5a5ed67914d1d64a0ea7d743ef93516f1f2c8501bc5ffb87af2066d3" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "620b9018d9504f79344c8ef3983ea4e83d209b46920f425240889d582be35881" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" default))
 '(package-selected-packages
   '(meow markdown-mode company-auctex latex-preview-pane auctex paredit company-fuzzy treemacs-projectile linum-relative flycheck-rust window-numbering eglot-jl enh-ruby-mode robe zenity-color-picker sublime-themes dumb-jump treemacs ivy projectile switch-window smex go-mode rust-mode scala-mode switch-window- ace-window neotree speedbar-git-respect company-c-headers company flycheck))
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
(require 'init-meow)
(require 'init-show-buffers)
(provide 'init)

;;; init ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
