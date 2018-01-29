(deftheme default-black
  "Automatically created 2013-05-20.")

(custom-theme-set-faces
 'default-black
 '(default ((t (:inherit nil :stipple nil :font "monospace-9" :background "Black" :foreground "White" :inverse-video nil :box nil :strike-t*hrough nil :overline nil :underline nil :slant normal :weight normal :width normal :height 100))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#111111"))))
 '(region ((nil (:background "#464740"))))
 '(helm-candidtate-number ((nil (:background "#464740"))))
 '(helm-candidtate-number-suspended ((nil (:background "#464740"))))
 '(helm-source-header ((nil (:background "Black" :foreground "chocolate1"))))
 '(hl-line ((nil (:background "#222222"))))
 '(helm-selection ((nil (:background "#222222"))))
 '(font-lock-warning-face ((nil (:foreground "#ff6666"))))
 '(show-paren-match ((nil (:background "#333399"))))
 '(show-paren-mismatch ((((class color)) (:background "red")))))

(provide-theme 'default-black)
