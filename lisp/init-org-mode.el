;;; init-org-mode --- Summary
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-todo-keywords '((sequence "TODO(t)" "ONGOING(o)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-agenda-files (list "~/.emacs.d/Schedule/timetable.org"))

(defun d/org-summary-todo (n-done n-not-done)
  "Switch header TODO state to DONE when all checkboxes are ticked, to TODO otherwise"
  (let ((todo-state (org-get-todo-state)) beg end)
    (unless (not todo-state)
      (save-excursion
        (org-back-to-heading t)
        (setq beg (point))
        (end-of-line)
        (setq end (point))
        (goto-char beg)
        (if (= n-not-done 0)
            (unless (string-equal todo-state "DONE")
              (org-todo 'done))
          (if (= n-done 0)
              (unless (string-equal todo-state "TODO")
                (org-todo 'todo))
            (unless (string-equal todo-state "ONGOING")
              (org-todo "ONGOING"))))))))

(add-hook 'org-after-todo-statistics-hook 'd/org-summary-todo)

;; snippet below is from
;; https://emacs.stackexchange.com/questions/19843/how-to-automatically-adjust-an-org-task-state-with-its-children-checkboxes
(defun d/org-checkbox-todo ()
  "Switch header TODO state to DONE when all checkboxes are ticked, to TODO otherwise"
  (let ((todo-state (org-get-todo-state)) beg end)
    (unless (not todo-state)
      (save-excursion
        (org-back-to-heading t)
        (setq beg (point))
        (end-of-line)
        (setq end (point))
        (goto-char beg)
        (if (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
                               end t)
            (if (match-end 1)
                (if (equal (match-string 1) "100%")
                    (unless (string-equal todo-state "DONE")
                      (org-todo 'done))
                  (if (equal (match-string 1) "0%")
                      (unless (string-equal todo-state "TODO")
                        (org-todo 'todo))
                    (unless (string-equal todo-state "ONGOING")
                      (org-todo "ONGOING"))))
              (if (and (> (match-end 2) (match-beginning 2)) ;; ensure cookies are activated
                       (equal (match-string 2) (match-string 3)))
                  (unless (string-equal todo-state "DONE")
                    (org-todo 'done))
                (if (equal (match-string 2) "0")
                    (unless (string-equal todo-state "TODO")
                      (org-todo 'todo))
                  (unless (string-equal todo-state "ONGOING")
                    (org-todo "ONGOING"))))))))))

(add-hook 'org-checkbox-statistics-hook 'd/org-checkbox-todo)

(global-set-key "\C-ca" 'org-agenda)

(provide 'init-org-mode)
;;; init-org-mode ends here

