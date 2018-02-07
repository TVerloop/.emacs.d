;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

; style I want to use in c mode
(c-add-style "c-style"
             '("stroustrup"
               (indent-tabs-mode . nil)        ; use spaces rather than tabs
               (c-basic-offset . 4)))            ; indent by four spaces
;               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
;                                   (brace-list-open . 0)
;                                   (statement-case-open . +)))))

(use-package smartparens)

(defun c-style-mode-hook ()
  (c-set-style "c-style")
  (flycheck-mode 1)
  (c-toggle-auto-hungry-state 1)
  (smartparens-mode 1))

;; apply styles when loaded
(use-package cc-mode
  :init
  (add-hook 'c-mode-hook 'c-style-mode-hook)
  (add-hook 'c++-mode-hook 'c-style-mode-hook)
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete)
  (define-key c-mode-map  [(C-tab)] 'c-indent-line-or-region)
  (define-key c++-mode-map  [(C-tab)] 'c-indent-line-or-region))

;; Add cmake to emacs
(use-package cmake-mode
  :init
  (use-package cmake-project
    :init
    (defun maybe-cmake-project-hook ()
      (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
    (add-hook 'c-mode-hook 'maybe-cmake-project-hook)
    (add-hook 'c++-mode-hook 'maybe-cmake-project-hook))
  (use-package cmake-font-lock
    :init
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))
  :config
  (setq auto-mode-alist
        (append
         '(("CMakeLists\\.txt\\'" . cmake-mode))
         '(("\\.cmake\\'" . cmake-mode))
         auto-mode-alist))
  (define-key cmake-mode-map  [(tab)] 'company-complete))

(provide 'setup-c)
