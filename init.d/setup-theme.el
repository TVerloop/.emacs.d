;;; package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package spaceline
  :after doom-themes
  :config
  (require 'spaceline-config)

  (setq spaceline-highlight-face-func #'(lambda ()
                                        'mode-line-highlight))

  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-projectile-root-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode +1)
  (spaceline-info-mode +1))

(req-package doom-themes
  :require all-the-icons neotree
  :config

  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  (add-to-list 'default-frame-alist
             '(font . "hack-9"))

  (load-theme 'doom-one t)

  (doom-themes-neotree-config)
  (doom-themes-org-config))

(provide 'setup-theme)
;;; setup-theme.el ends here
