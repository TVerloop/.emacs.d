(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
  (use-package all-the-icons
    :config
    (doom-themes-neotree-config)
    (doom-themes-visual-bell-config)))

(provide 'setup-doom-themes)
