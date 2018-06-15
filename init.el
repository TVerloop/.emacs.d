;;; init.el --- Entrypoint of emacs.
;;;
;;; Author: Tom.Verloop <T93.Verloop@gmail.com>
;;; URL:    https://github.com/TVerloop/.emacs.d
;;;
;;; Commentary:
;;;
;;; Code:

(package-initialize)

(add-to-list 'load-path
	     (expand-file-name "init.d" user-emacs-directory))

;; Add custom.el which contain custom settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; Create custom.el if it does not exist.
(unless (file-exists-p custom-file)
  (write-region "" "" custom-file))
;; Load the custom.el
(load custom-file)

(require 'setup-package)    ;; Initialize package manager.
(require 'setup-general)    ;; Initialize general settings and packages.
(require 'setup-editing)    ;; Initialize editor settings and packages.
(require 'setup-company)    ;; Initialize Company.
(require 'setup-flycheck)   ;; Initialize Flycheck.
(require 'setup-rtags)	    ;; Initialize RTags.
(require 'setup-helm)	    ;; Initialize Helm.
(require 'setup-projectile) ;; Initialize Projectile.
(require 'setup-theme)	    ;; Initialize Emacs theme.
(require 'setup-cedet)      ;; Initialize cedet
(require 'setup-c-mode)     ;; Initialize C/C++ mode.
(require 'setup-cmake-mode) ;; Initialize CMake mode.
(require 'setup-magit)      ;; Initialize Magit.
(require 'setup-neotree)    ;; Initialize Neotree.
(require 'setup-eshell)
(require 'setup-org-mode)

(req-package-finish)

(provide 'init)
;;; init.el ends here
