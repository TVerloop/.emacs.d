;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ede
  :require semantic
  :config
  (global-ede-mode)                         ;; Enable CEDET.
  (global-semanticdb-minor-mode 1)          ;; Enable Semanticdb minor mode.
  (global-semantic-idle-scheduler-mode 1)   ;; Automatically reparse buffer in idle time.
  (global-semantic-stickyfunc-mode 1)       ;; Show title of a tag in header line.
  (semantic-mode 1))                        ;; Enable Semantic mode,

(provide 'setup-cedet)
;;; setup-cedet.el ends here
