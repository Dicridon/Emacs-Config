;;; show-buffers -- Summary
;;; Commentary:
;;; Code:
(require 'cl-lib)

(defvar show-buffers-buffer-name "*ShowBuffers*")

;;; helper functions
(defun show-buffers-get-current-buffer-name ()
  "Get buffer name on current line in the show buffer."
  (let ((s (line-beginning-position))
        (e (line-end-position)))
    (string-remove-suffix "*" (buffer-substring-no-properties s e))))

(defun show-buffers-get-user-buffers ()
  "Get user buffers, discarding buffers like *Messages*, *scratch*, etc."
  (cl-remove-if (lambda (buf)
                  (or (string-prefix-p " " (buffer-name buf))
                      (string-prefix-p "*" (buffer-name buf))))
                (buffer-list)))

(defun show-buffers-get-modified-user-buffers ()
  "Get all modified user buffers."
  (let ((buffers (show-buffers-get-user-buffers)))
    (seq-filter (lambda (buf)
                  (buffer-modified-p buf))
                buffers)))

(defun show-buffers-get-user-buffers-as-strings ()
  "Get user buffers in order as a list of strings."
  (sort (mapcar 'buffer-name (show-buffers-get-user-buffers)) 'string<))

(defun show-buffers-insert-user-buffer-list ()
  "Insert user buffer list to show-buffers buffer."
  (dolist (buf (show-buffers-get-user-buffers-as-strings))
    (if (buffer-modified-p (get-buffer buf))
        (insert (format "%s*\n" buf))
      (insert (format "%s\n" buf)))))

(defun show-buffers-buffer-exsits ()
  "Check if a show buffer already exists."
  (get-buffer show-buffers-buffer-name))

(defun show-buffers-buffer-displayed ()
  "Check is a show buffer already exsits and displayed."
  (get-buffer-window show-buffers-buffer-name))

(defun show-buffers-get-show-buffer ()
  "Get show-buffers buffer."
  (get-buffer show-buffers-buffer-name))

(defun show-buffers-display-in-side-window (buf)
  "Display show buffers buffer in a side window.
BUF is the show buffer."
  (display-buffer buf
                  (display-buffer-in-side-window buf '((side . right)
                                                       (window-width . 35)
                                                       (dedicated . t)))))

(defun show-buffers-valid-buffer-to-show-buffers ()
  "Check if current buffer is the show-buffers buffer."
  (string= show-buffers-buffer-name (buffer-name (current-buffer))))

;;; toggole show buffers
(defun show-buffers-init()
  "Called when show-buffers is first called."
  (let ((buf (get-buffer-create show-buffers-buffer-name)))
    (with-current-buffer buf
      (show-buffers-insert-user-buffer-list)
      (show-buffers-display-in-side-window buf)
      (show-buffers-mode)
      (goto-char (point-min)))))

(defun show-buffers-refresh()
  "Called when a show-buffers buffer already exsits."
  (when (show-buffers-buffer-displayed)
    (let ((buf (show-buffers-get-show-buffer)))
      (with-current-buffer buf
        (let ((pnt (point)))
          (read-only-mode -1)
          (erase-buffer)
          (show-buffers-insert-user-buffer-list)
          (read-only-mode)
          (goto-char pnt)
          (set-window-point (get-buffer-window buf) pnt)
          (hl-line-highlight))))))

(defun show-buffers-refresh-and-display ()
  "Called when a show-buffers buffer already exists but not shown."
  (let ((buf (show-buffers-get-show-buffer)))
    (with-current-buffer buf
      (let ((pnt (point)))
        (read-only-mode -1)
        (erase-buffer)
        (show-buffers-insert-user-buffer-list)
        (show-buffers-display-in-side-window buf)
        (read-only-mode)
        (goto-char pnt)
        (set-window-point (get-buffer-window buf) pnt)
        (hl-line-highlight)))))

(defun show-buffers ()
  "Open or refresh a dedicated window displaying all user buffers.
Cursor remains in current buffer.
To close show-buffers buffer, switch to it and press q"
  (interactive)
  (if (show-buffers-buffer-displayed)
      (show-buffers-refresh)
    (if (show-buffers-buffer-exsits)
        (show-buffers-refresh-and-display)
      (show-buffers-init))))

(defvar show-buffers-refresh-timer nil
  "Periodically refresh show-buffers buffer.")

(defun show-buffers-close ()
  "Close the show-buffers buffer, cancel the show-buffers-refresh timer."
  (interactive)
  (if (show-buffers-buffer-exsits)
      (kill-buffer (show-buffers-get-show-buffer)))
  (cancel-timer show-buffers-refresh-timer))

;;; keep content in show buffer up-to-date
(defun show-buffers-refresh-find-file-hook ()
  "Called when a show buffer is present and a buffer is killed."
  (when (show-buffers-buffer-displayed)
    (let ((show-buffers-buffer (show-buffers-get-show-buffer))
          (cur-buf-name (buffer-name (current-buffer)))
          (buffers (show-buffers-get-user-buffers-as-strings)))
      (with-current-buffer show-buffers-buffer
        (read-only-mode -1)
        (setf (buffer-string) "")
        (dolist (buf (remove cur-buf-name buffers))
          (insert (format "%s\n" buf)))
        (read-only-mode)))))

(defun show-buffers-refresh-kill-buffer-hook ()
  "Called when a show buffer is present and a buffer is killed."
  (when (show-buffers-buffer-displayed)
    (show-buffers)))

;;; functions for key bindings
(defun show-buffers-display-the-buffer ()
  "Switch to the buffer under cursor."
  (interactive)
  (let ((buf (show-buffers-get-current-buffer-name)))
    (if (get-buffer buf)
        (progn
          (message "Buffer %s found" buf)
          (display-buffer buf)
          (switch-to-buffer buf))
      (progn
        (message "No buffer named %s exsits" buf)))))

(defun show-buffers-kill-the-buffer ()
  "Kill the buffer under cursor."
  (interactive)
  (let ((buf (show-buffers-get-current-buffer-name)))
    (if (get-buffer buf)
        (progn
          (kill-buffer buf)
          (show-buffers-refresh))
      (progn
        (message "No buffer named %s exsits" buf)))))

(defun show-buffers-save-the-buffer ()
  "Save the buffer under cursor."
  (interactive)
  (let ((buf (show-buffers-get-current-buffer-name)))
    (if (get-buffer buf)
        (progn
          (with-current-buffer buf
            (save-buffer))
          (show-buffers-refresh))
      (progn
        (message "No buffer named %s exsits" buf)))))

(defun show-buffers-save-all-modified-buffers ()
  "Save all modified buffers."
  (interactive)
  (dolist (buf (show-buffers-get-modified-user-buffers))
    (with-current-buffer buf
      (save-buffer)))
  (show-buffers-refresh))

(defvar show-buffers-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'show-buffers-refresh)
    (define-key map "k" 'show-buffers-kill-the-buffer)
    (define-key map "s" 'show-buffers-save-the-buffer)
    (define-key map "S" 'show-buffers-save-all-modified-buffers)
    (define-key map "\r" 'show-buffers-display-the-buffer)
    (define-key map "q" 'show-buffers-close)
    map)
  "Keymap for show-buffers-mode.")

;;; learned this from treemacs
;;; use an advice function to avoid interactive call to show-buffers-mode
(defun show-buffers--mode-check-advice (mode-activation &rest args)
  "Prevent from activating show-buffers-mode directly.
MODE-ACTIVATION is only called with ARGS when show-buffers buffer is current buffer."
  (cond
   ((eq major-mode 'show-buffers-mode)
    (ignore "show-buffers-mode is not intended to be activated manually."))
   ((show-buffers-valid-buffer-to-show-buffers)
    (apply mode-activation args))
   (t
    (message "Use command show-buffers instead of show-buffers-mode.")
    )))

(define-derived-mode show-buffers-mode special-mode "show buffers"
  "Display all user buffers in a side window"
  (add-hook 'find-file-hook 'show-buffers-refresh-find-file-hook)
  (add-hook 'kill-buffer-hook 'show-buffers-refresh-kill-buffer-hook)
  (hl-line-mode)
  (setq show-buffers-refresh-timer (run-with-timer 2 1 'show-buffers-refresh))
  (setq window-size-fixed 'width))

(advice-add #'show-buffers-mode :around #'show-buffers--mode-check-advice)

(provide 'show-buffers)
;;; show-buffers ends here
