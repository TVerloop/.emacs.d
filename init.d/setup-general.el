;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

;; No menu-/tool-/scroll-bar.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq font-lock-maximum-decoration t        ;; Maximum font-lock decoration.
      truncate-partial-width-windows t      ;; Truncate lines in window narrower than the frame.
      inhibit-startup-message t             ;; No startup message.
      frame-resize-pixelwise t)             ;; Make windowresizing work correctly in XFCE.

;; Window title is current buffers filename.
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Highlight line currently being edited.
(global-hl-line-mode 1)
;; Show line numbers.
(global-linum-mode 1)
;; Show column number.
(column-number-mode 1)

;; Show matching parenthesis.
(show-paren-mode 1)

;; Y and N are good enough.
(defalias 'yes-or-no-p 'y-or-n-p)

;; In programming mode show trailing whitespace.
(add-hook 'prog-mode-hook
	  (lambda () (interactive)
	    (setq show-trailing-whitespace 1)))

;; F5 to compile.
(global-set-key (kbd "<f5>") (lambda ()
			       (interactive)
			       (setq-local compilation-read-command nil)
	               (call-interactively 'compile)))

;; GDB Many windows.
(setq gdb-many-windows t
      gdb-show-main t)

;; Revertable "delete-other-window"
(req-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)))

;; Show whitespace mode.
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Switch windows using shift-<ARROW>
(windmove-default-keybindings)

;; Put backups in dedicated directory.
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups"))))
      delete-old-versions t                                 ;; Delete old versions.
      kept-new-versions 6                                   ;; Keep 6 new versions.
      kept-old-versions 2                                   ;; Keep 2 old versions.
      version-control t)                                    ;; Backup with version control.

(provide 'setup-general)
;;; setup-general.el ends here
