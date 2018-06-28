;;; Package -- summary
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(setq global-mark-ring-max 5000         ;; Max 5000 items in global mark ring.
      mark-ring-max 5000                ;; Max 5000 items in mark ring.
      kill-ring-max 5000                ;; Max 5000 items in kill ring.
      kill-whole-line t                 ;; kill-line kills whole line when cursor is at the start.
      mode-require-final-newline t      ;; Add newline to end of file when saving.
      tab-width 4)                      ;; Tab width 4 spaces.

;; UTF-8 encoding.
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; Default indenting use spaces.
(setq-default indent-tabs-mode nil
              ;; Tabs stops every 4 characters.
              tab-stop-list (number-sequence 4 120 4))

;; Typing with a selection overwrites the selection.
(delete-selection-mode)

;; Make newline also indent.
(global-set-key (kbd "RET") 'newline-and-indent)

;; Show whitespace in diff mode.
(add-hook 'diff-mode-hook
	  (lambda ()
	    (setq-local whitespace-style
			'(face
			  tabs
			  tab-mark
			  spaces
			  space-mark
			  trailing
			  indentation::space
			  indentation::tab
			  newline
			  newline-mark))
	    (whitespace-mode 1)))

;; Visual feedback to operations.
(req-package volatile-highlights
  :init
  (volatile-highlights-mode t))

;; Visual un-/redo mode.
(req-package undo-tree
  :init
  (global-undo-tree-mode 1))

;; Auto indent.
(req-package clean-aindent-mode
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

;; Indentation guessing.
(req-package dtrt-indent
  :init
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0))

;; Column indicator.
(req-package fill-column-indicator
  :init
  (setq-default fill-column 120)
  (add-hook 'prog-mode-hook 'fci-mode))


;; Automatic whitespace trimming.
(req-package ws-butler
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

(global-set-key (kbd "M-;") 'comment-dwim-2)

;; Highlight match indicator.
(req-package anzu
  :init
  (global-anzu-mode)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

;; Multi-region editing.
(req-package iedit
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))

(provide 'setup-editing)
;;; setup-editing.el ends here
