;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package neotree
  :require all-the-icons
  :config
  ;; Toggle neotree with f8
  (global-set-key [f8] 'neotree-toggle)
  ;; Use icons.
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(provide 'setup-neotree)
;;; setup-neotree ends here
