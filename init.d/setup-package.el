;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
  	("marmalade" . "https://marmalade-repo.org/packages/")
  	("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'req-package)
  (package-install 'req-package))

(require 'req-package)

(setq use-package-always-ensure t)

(provide 'setup-package)
;;; setup-package.el ends here
