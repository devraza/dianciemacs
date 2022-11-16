;;; lisp/org-mode.el --- org-mode improvements for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; A lot of people out there will agree wholeheartedly that org mode is great.
;; Tons of fine-grained control, simplicity, and extensibilty - all built-in by
;; default into a single tool that works beautifully with Emacs.
;;
;;; Code:

;; org-mode ;; org-superstar
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
(plist-put org-format-latex-options :scale 2.5)

;; Enable org-superstar-mode in org-mode files
(add-hook 'org-mode-hook 'org-superstar-mode)

;; org-roam - A plain-text personal knowledge management system
(use-package org-roam
  :custom
  (org-directory file-truename "~/Org/") ; Set the folder used by org-mode
  (org-roam-directory (file-truename "~/Org/Roam/")) ; Set the folder used by org-roam
  :init
  (org-roam-db-autosync-mode 1)) ; Automatically sync nodes

(setq org-roam-capture-templates
      '(("d" "default" plain
         "\n%?"
        :if-new (file+head "${slug}.org" "#+title: ${title}\n#+date: %U\n#+author: %n\n")
        :unnarrowed t)))

;; Keybinds for org-mode
;; evil-org - Some nice keybinds for org-mode and org-agenda
(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'org-agenda-mode-hook 'evil-org-mode)
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(general-create-definer diancite/org
  :prefix leader-key)

(diancite/org
 :keymaps 'normal
 "n r" '(org-roam-node-find :wk "Find Nodes")
 "n s" '(org-roam-db-sync :wk "Sync Nodes")
 "n c" '(org-todo :wk "Cycle Todo")
 "n l" '(org-latex-preview :wk "Preview Latex")
 "n a" '(org-agenda :wk "Agenda")
 "n t" '(org-table-align :wk "Align Table"))

(setq org-agenda-files (quote ("~/Org")))

;;; org-mode.el ends here
