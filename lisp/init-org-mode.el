;;; init-org-mode --- Summary
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-agenda-files (list "~/.emacs.d/Schedule/timetable.org"))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(global-set-key "\C-ca" 'org-agenda)

(provide 'init-org-mode)
;;; init-org-mode ends here
