(use-package docker)

(use-package dockerfile-mode
  :init
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package docker-compose-mode
  :init
  (add-to-list 'auto-mode-alist '("docker-compose.yml\\'" . dockerfile-mode)))

(provide 'setup-docker)
