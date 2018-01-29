(defun neotree-toggle-and-switch-back ()
  (neotree-toggle)
  (other-window -1))

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

(use-package neotree
  :init
  (use-package projectile
    :init
    ;; Neotree automatically switch to project
    (setq projectile-switch-project-action 'neotree-projectile-action))
  (global-set-key [f8] 'neotree-toggle)
  :config
  (neotree-toggle-and-switch-back))

(provide 'setup-neotree)
