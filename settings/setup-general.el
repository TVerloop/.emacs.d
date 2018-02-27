(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)
(setq frame-resize-pixelwise t)

(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))


(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Highlight current line
(global-hl-line-mode 1)

;; Show line numbers
(global-linum-mode 1)

;; Show column numbers
(column-number-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Set font size to 9pt
(set-face-attribute 'default nil :height 90 :family "monospace")

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-clang company-backends))

;; Package: projectile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups"))))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

(provide 'setup-general)
