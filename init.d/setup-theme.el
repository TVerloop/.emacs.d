;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package doom-themes
  :require all-the-icons neotree
  :config
  (require 'font-lock+)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(provide 'setup-theme)
;;; setup-theme.el ends here
