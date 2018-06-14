;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

;; Helm
(req-package helm
  :config
  (require 'helm-config)
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (setq helm-move-to-line-cycle-in-source t         ;; Cycle to top or bottem when end is reached.
    	helm-ff-search-library-in-sexp t            ;; Search for library in 'require' and 'declare-function.
        helm-scroll-amount 8                        ;; Scroll amount when scrolling other window in helm session.
        helm-ff-file-name-history-use-recentf t     ;; Use recentf-list.
        helm-echo-input-in-header-line t            ;; Send current input in header-line.
        helm-exit-idle-delay 0)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)

  (setq helm-M-x-fuzzy-match t                      ;; Enable fuzzy matching in helm-M-x.
        helm-buffers-fuzzy-matching t               ;; Enable fuzzy matching in buffers.
    	helm-recentf-fuzzy-match t                  ;; Enable fuzzy matching in recentf.
        helm-semantic-fuzzy-match t                 ;; Enable fuzzy matching in semantic.
	helm-imenu-fuzzy-match t)                   ;; Enable fuzzy matching in imenu.

  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

  (setq helm-split-window-inside-p t        ;; Split inside slected window.
	helm-autoresize-max-height 50       ;; Helm buffer max 50 pixels.
	helm-autoresize-min-height 30)      ;; Helm buffer min 30 pixels.

  ;; Autoresize helm buffer.
  (helm-autoresize-mode 1)

  ;; Enable Helm mode.
  (helm-mode 1))

(req-package helm-projectile
  :require helm projectile
  :config
  ;; Set helm as completion system for projectile.
  (setq projectile-completion-system 'helm)
  ;; Enable helm projectile.
  (helm-projectile-on))

(provide 'setup-helm)
;;; setup-helm.el ends here
