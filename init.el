(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(dumb-jump treemacs-projectile ivy treemacs projectile scala-mode flycheck-rust switch-window- switch-window avy ace-window neotree smex speedbar-git-respect company-c-headers company flycheck use-package))
 '(safe-local-variable-values
   '((company-c-headers-path-user "/home/frostfall/LinuxDev/Research/NVM/Dev/Sea/src/components/")
     (company-clang-arguments "-I/home/frostfall/LinuxDev/Research/NVM/Dev/Sea/src/components/")
     (company-c-headers-path-user "./src/components/" "./components/")
     (company-clang-arguments "-I./src/components/" "-I./components/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)


;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


(use-package company
	     :ensure t
	     :init
             (global-company-mode)
             (setq company-idle-delay 0)
             (setq company-minimum-prefix-length 2)
             (add-to-list 'company-backends 'company-c-headers)
             (setq company-backends (delete 'company-semantic company-backends)))

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-clang-include-path
        (list "./src/" "./src/components/" "./components/")))

(use-package smex
  :ensure t
  :init
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-; c") 'avy-goto-char)
  (global-set-key (kbd "C-; l") 'avy-goto-line)
  (global-set-key (kbd "C-; w") 'avy-goto-word-1))

(use-package switch-window
  :ensure t
  :config
  (global-set-key (kbd "C-x o") 'switch-window))

(use-package flycheck-rust
  :ensure t)

(use-package rust-mode
  :ensure t
  :init
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :config
  (setq projectile-project-root-functions '(projectile-root-top-down-recurring
                                            projectile-root-local
                                            projectile-root-bottom-up
                                            projectile-root-top-down)))

(projectile-register-project-type 'canoe '(".canoe")
                                  :project-file "config.json"
                                  :compile "canoe build"
                                  :run "canoe run")

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))

(use-package treemacs
  :ensure t
  :bind (("C-c e e" . treemacs)
         ("C-c e x" . treemacs-display-current-project-exclusively)
         ("C-c e s" . treemacs-switch-workspace)))

(use-package dumb-jump
  :ensure t
  :init (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))


;; Some customization
;;; parenthesis
(electric-pair-mode t)
(show-paren-mode t)

;;; indentation
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

;;; linum
(global-linum-mode t)

;;; bell
(setq ring-bell-function 'ignore)

(provide 'init)
;;;
