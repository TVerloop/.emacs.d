;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

;; Flycheck symantics checking.
(req-package flycheck
  :require flycheck-rust
  :config

  (global-flycheck-mode)
  ;; Enable cppcheck as secondary checker.

  (add-hook 'rust-mode-hook #'flycheck-rust-setup)

  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (progn
                    (setq flycheck-cppcheck-checks "all")
                    (flycheck-add-next-checker 'rtags 'c/c++-cppcheck))))))

(provide 'setup-flycheck)
;;; setup-flycheck ends here
