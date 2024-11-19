(use-package pyim
  :ensure t
  :config
  (setq default-input-method "pyim")
  (setq pyim-page-length 9)
  ;; (setq pyim-dcache-backend 'pyim-dregcache)
  (setq pyim-pinyin-fuzzy-alist '())
  (setq pyim-enable-shortcode nil)
  (pyim-default-scheme 'microsoft-shuangpin)
  (setq pyim-indicator-list (list #'pyim-indicator-with-modeline)))

(use-package pyim-basedict
  :ensure t)

(require 'pyim)
(require 'pyim-basedict)

(pyim-basedict-enable)


(provide 'init-pyim)
;; init-pyim ends here

