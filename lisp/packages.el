;;; This file contains the packages that Dianciemacs uses

;; magit - A beautiful git porcelain for Emacs
(use-package magit)

;;; Themes
;; Install the Doom Emacs theme megapack.
(use-package doom-themes)
  
;; kaolin-themes, depends on autothemer
(use-package kaolin-themes
  :requires autothemer)

(use-package autothemer)

;; all-the-icons - Icons for various UI elements
(use-package all-the-icons)

;;; org-mode
;; org-superstar
(use-package org-superstar)

;;; evil - A Vi layer inside of Emacs
(use-package evil
  :init
  (setq evil-want-keybinding nil ; Make room for evil-collection
	evil-want-integration t ; Same as above
	evil-undo-system 'undo-fu)) ; Set the undo/redo system

;; A collection of keybinds for evil-mode
(use-package evil-collection
  :after evil) ; In order to recognize evil-want-... being set

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu)

;;; Keybinds
(use-package which-key)

;; Provide this file to init.el
(provide 'packages)
