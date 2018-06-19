;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defvar neotree/previous-directory
  nil)

(req-package neotree
  :require all-the-icons
  :config
  ;; Toggle neotree with f8
  (global-set-key [f8] 'neotree-toggle)
  ;; Use icons.
  (setq neo-theme (if (display-graphic-p)
                      'icons
                    'arrow
                    )
        )

  ;; Open neotree at startup.
  (add-hook 'after-init-hook
            (lambda ()
              (neotree-show)
              (other-window 1)
              )
            )
  )

(provide 'setup-neotree)
;;; setup-neotree ends here
