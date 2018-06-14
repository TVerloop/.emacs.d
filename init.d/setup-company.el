;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

;; Company completion.
(req-package company
  :require company-c-headers
  :config
  ;; Disable Clang as company backend.
  (setq company-backends (delete 'company-clang company-backends))
  ;; Add C Headers as company backend.
  (add-to-list 'company-backends 'company-c-headers)
  ;; Set global company mode on initialization.
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
  (setq company-idle-delay 0))

;; Yasnippet backend for Company.
(req-package yasnippet
  :require company yasnippet-snippets
  :config
  (yas-reload-all)
  (add-to-list 'company-backends 'company-yasnippet t)
  (yas-global-mode 1))

(provide 'setup-company)
;;; setup-company.el ends here
