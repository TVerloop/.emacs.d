;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package magit
  :config
  ;; Skip past comment line in git commit mode.
  (add-hook 'git-commit-mode-hook '(lambda ()
                                     (beginning-of-buffer)
                                     (when (looking-at "#")
                                       (forward-line 2))))

  (setq magit-push-always-verify nil
        magit-revert-buffers 'silent
        magit-no-confirm '(stage-all-changes
                           unstage-all-changes)
        magit-diff-refine-hunk t))

(provide 'setup-magit)
;;; setup-magit.el ends here
