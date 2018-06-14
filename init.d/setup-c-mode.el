;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(c-add-style "c-style"
             '("stroustrup"                                     ;; Inherit stroustrup style.
               (c-lineup-comment . t)                           ;; Lineup comment.
               (indent-tabs-mode . nil)                         ;; Use spaces for indentation.
               (c-basic-offset . 4)                             ;; 4 spaces indentation.
               (c-offsets-alist . ((innamespace . [0])))        ;; No indentation in namespaces.
               (c-offsets-alist . ((inextern-lang . [0])))))    ;; No indentation in extern "C" blocks.

(req-package cc-mode
  :require smartparens
  :config
  (defun c-style-setup ()
    (smartparens-mode 1))
  (add-hook 'c-mode-hook 'c-style-setup)
  (add-hook 'c++-mode-hook 'c-style-setup))

(provide 'setup-c-mode)
;;; setup-c-mode.el ends here
