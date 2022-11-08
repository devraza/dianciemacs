;;; This file contains configuration for Emacs' org-mode

;;; org-mode
;; org-superstar
(use-package org-superstar
  :config
  ;; Change org-mode's heading bullets
  (setq org-superstar-headline-bullets-list
	'("🞉" "🞈" "🞇" "🞆" "🞅" "🞄")))

;; Customize org-mode's default functionality
(setq org-ellipsis "..."
      org-use-property-inheritance t
      org-list-allow-alphabetical t
      org-catch-invisible-edits 'smart
      org-startup-indented t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300)
      org-pretty-entities t
      org-hide-leading-stars t
      org-adapt-indentation t)

;; Faces for the font sizes of org-mode headings
(set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
(set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.15)
(set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.35)
(set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.65)
(set-face-attribute 'org-document-title nil
                    :height 1.85
                    :foreground 'unspecified
                    :inherit 'org-level-8)

;; Scale up latex elements
(plist-put org-format-latex-options :scale 1.75)

;; Enable org-superstar-mode in org-mode files
(add-hook 'org-mode-hook 'org-superstar-mode)

;; Provide this file to init.el
(provide 'org-mode)
