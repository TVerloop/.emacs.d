;;; Package --- Summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package org
  :config
  (setq org-log-done 'time
        org-todo-keywords '((sequence
                             "TODO" "IN-PROGRESS" "WAITING" "DONE")))

  (define-key global-map (kbd "C-c l") 'org-store-link)
  (define-key global-map (kbd "C-c a") 'org-agenda))


(provide 'setup-org-mode)
;;; setup-org-mode.el ends here
