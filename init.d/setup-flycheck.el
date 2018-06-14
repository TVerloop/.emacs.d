;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

;; Flycheck symantics checking.
(req-package flycheck
  :require
  :config
  ;; Enable cppcheck as secondary checker.
  (defun setup-flycheck-cppcheck ()
    (setq flycheck-cppcheck-checks "all")
    (flycheck-add-next-checker 'rtags 'c/c++-cppcheck))
  (add-hook 'c-mode-hook 'setup-flycheck-cppcheck)
  (add-hook 'c++-mode-hook 'setup-flycheck-cppcheck)
  (global-flycheck-mode))

(provide 'setup-flycheck)
;;; setup-flycheck ends here
