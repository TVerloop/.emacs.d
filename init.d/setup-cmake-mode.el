;;; Package --- summary
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package cmake-mode
  :require cmake-font-lock
  :config
  ;; Enable CMake Mode when in file "CMakelists.txt" or "*.cmake"
  (setq auto-mode-alist (append
                         '(("CMakeLists\\.txt\\'" , cmake-mode))
                         '(("\\,cmake\\'" . cmake-mode))
                         auto-mode-alist)))

(provide 'setup-cmake-mode)
;;; setup-cmake-mode.el ends here
