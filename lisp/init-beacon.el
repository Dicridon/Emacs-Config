;;; init-company --- Summary
;;; Commentary:
;;; Code:

(use-package beacon
  :ensure t
  :config
  (global-set-key (kbd "C-c b b") 'beacon-blink))

(setq beacon-blink-when-focused t)
(setq beacon-blink-duration 0.5)
(setq beacon-blink-delay 0.3)
(setq beacon-size 75)

(beacon-mode 1)
(provide 'init-beacon)
;;; init-beacon ends here
