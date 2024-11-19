;;; init-latex --- Summary
;;; Commentary:
;;; Code:
(use-package latex
  :ensure auctex
  :config
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (let ((xelatexmk '("xelatexmk" "latexmk -xelatex main.tex"
                                                  TeX-run-TeX nil t
                                                  :help "Run latexmk on file")))
                                 (unless (member xelatexmk TeX-command-list)
                                   (push  xelatexmk TeX-command-list))))))

(add-hook 'LaTeX-mode-hook 'eglot-ensure)
(add-hook 'LaTeX-mode-hook 'imenu-list-minor-mode)
(provide 'init-latex)
;;; init-latex ends here
