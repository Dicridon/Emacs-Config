(use-package pyim
  :ensure t)

(use-package pyim-basedict
  :ensure t)

(require 'pyim)
(require 'pyim-basedict)

(pyim-basedict-enable)

(setq default-input-method "pyim")
(setq pyim-page-length 12)

(pyim-default-scheme 'microsoft-shuangpin)

(setq pyim-indicator-list (list #'pyim-indicator-with-modeline))
(provide 'init-pyim)
;; init-pyim ends here
