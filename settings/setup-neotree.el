(use-package neotree)
(use-package projectile)

;; Set ascii theme
(setq neo-theme 'ascii)

;; Neotree automatically switch to project
(setq projectile-switch-project-action 'neotree-projectile-action)

;;
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key [f8] (lambda ()
                        (neotree-project-dir)))

(provide 'setup-neotree)
