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

(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (progn
                  (c-set-style "c-style")))))

(req-package smartparens
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (smartparens-mode 1))))

(provide 'setup-c-mode)
;;; setup-c-mode.el ends here
