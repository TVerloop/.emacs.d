;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package eshell
  :require exec-path-from-shell dash s cl ansi-color
  :config
  (require 'em-tramp)
  (setq comint-prompt-read-only t)

  ;;Enable the new eshell prompt
  (setq eshell-banner-message ""
        eshell-prompt-regexp "└─\\[.+\\]━\\$ "
        eshell-prompt-function
        (lambda ()
          (concat
           ;; Line 1 Opening
           (propertize "┌─[ "  'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))

           ;; Directory.
           (propertize (all-the-icons-faicon "folder-open" :face '(:foreground "gold")) 'display '(raised . 0))
           (propertize " ")
           (propertize (abbreviate-file-name (eshell/pwd)) 'face '(:foreground "gold"))

           (propertize " | " 'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))
           ;; Git properties.
           (propertize (all-the-icons-alltheicon "git" :face '(:foreground "#f74e27" :height 1.1)) 'display '(raised . 0))
           (propertize " ")
           (propertize (let ((branch (magit-get-current-branch)))
                         (if branch branch "-")) 'face '(:foreground "#f74e27"))


           (propertize " | " 'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))
           ;; Clock
           (propertize (all-the-icons-octicon "clock" :face '(:foreground "#98be65" :height 1.1)) 'display '(raised . 0))
           (propertize " ")
           (propertize (format-time-string "%H:%M" (current-time)) 'face '(:foreground "#98be65" :height 1.1 :weight ultra-bold))

           (propertize " ]\n"  'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))

           (propertize "└─[ "  'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))

           ;; Username
           (propertize (user-login-name) 'face '(:foreground "#c678dd" :height 1.1 :weight ultra-bold))

           (propertize "@" 'face '(:foreground "#c678dd" :height 1.1 :weight ultra-bold))
           ;; Hostname
           (propertize (system-name) 'face '(:foreground "#c678dd" :height 1.1 :weight ultra-bold))
           (propertize " ]━$" 'face '(:foreground "#51afef" :height 1.1 :weight ultra-bold))
           (propertize " "))))

  (defun pcomplete/sudo ()
    (let ((prec (pcomplete-arg 'last -1)))
      (cond ((string= "sudo" prec)
             (while (pcomplete-here*
                     (funcall pcomplete-command-completion-function)
                     (pcomplete-arg 'last) t))))))

  (defun eshell/clear ()
    "Clear the eshell buffer."
    (let ((inhibit-read-only t))
      (erase-buffer)))

  (setq eshell-scroll-to-bottom-on-input 'all
        eshell-error-if-no-glob t
        eshell-hist-ignoredups t
        eshell-save-history-on-exit t
        eshell-prefer-lisp-functions t
        eshell-prefer-lisp-variables t
        password-cache t
        password-cache-expiry 3600
        eshell-destroy-buffer-when-process-dies t)

  (add-hook 'eshell-mode-hook
            (lambda ()
              (linum-mode -1)
              (eshell-cmpl-initialize)
              (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
              (add-to-list 'eshell-visual-commands "ssh")
              (add-to-list 'eshell-visual-commands "tail")
              (add-to-list 'eshell-visual-commands "top")
              (add-to-list 'eshell-visual-commands "htop")))
              ;; Set $PATH from .bashrc
  (when window-system
    (exec-path-from-shell-initialize)))

(provide 'setup-eshell)
;;; setup-eshell.el ends here
