;;; init-show-buffers :: Summary
;;; Commentary
;;; Code
(add-to-list 'load-path "~/.emacs.d/lisp/personal")

(require 'show-buffers)
(global-set-key (kbd "C-c C-b") 'show-buffers)

(provide 'init-show-buffers)
;;; init-show-buffers ends here
