
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(if (file-directory-p site-lisp-dir) nil
  (make-directory site-lisp-dir))

;; Add custom functions from defuns dir
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Add dependencies to load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)


(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Add Custom.el which contain custom settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'setup-package)

(require 'setup-doom-themes)
(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
(require 'setup-cedet)
(require 'setup-editing)

;; Add custom functions from defuns dir
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Setup appearance
(require 'appearance)
;; Setup key-bindings
(require 'key-bindings)
;; Apply sanity to emacs
(require 'sane-defaults)

;; setup shell
(use-package shell
  :config
  (require 'setup-shell))

;; Setup magit
(use-package magit
  :config
  (require 'setup-magit))

;; Setup neotree
(require 'setup-neotree)
;; Setup flycheck
(require 'setup-flycheck)
;; Setup c style
(require 'setup-c)
;; Setup Docker mode
(require 'setup-docker)
