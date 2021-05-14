;;; init --- Summary
;;; Commentary:
;;; Code:

(add-hook 'rust-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd-8"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(provide 'init-c-cxx)
;;; init-c-cxx ends here
