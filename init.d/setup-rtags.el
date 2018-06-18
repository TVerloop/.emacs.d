;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package rtags
  :config
  ;; Install rtags if not found.
  (unless (and (rtags-executable-find "rc")
               (rtags-executable-find "rdm"))
    (progn (rtags-install)
           (kill-buffer)))

  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (rtags-start-process-unless-running))))

  (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
  (define-key c-mode-base-map (kbd "M-,") 'rtags-find-reference-at-point)
  (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)

  (rtags-enable-standard-keybindings)

  (setq rtags-use-helm t)

  (add-hook 'kill-emacs-hook 'rtags-quit-rdm))

;; Rtags backend for Company.
(req-package company-rtags
  :require company rtags
  :config
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (progn
                    (add-to-list (make-local-variable 'company-backends)
		                 'company-rtags)
                    (add-to-list (make-local-variable 'company-backends)
		                 'company-yasnippet))))))

;; RTags backend for flycheck.
(req-package flycheck-rtags
  :require flycheck rtags
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (progn (flycheck-select-checker 'rtags)
                         (setq-local flycheck-highlight-mode nil
                                     flycheck-check-syntax-automatically nil)
                         (rtags-set-periodic-reparse-timeout 2.0))))))

(req-package helm-rtags
  :require helm rtags
  :config
  (setq rtags-display-results-backend 'helm))

(provide 'setup-rtags)
;;; setup-rtags.el ends here
