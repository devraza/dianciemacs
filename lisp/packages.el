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
  :config
  (setq evil-want-keybinding nil ; Make room for evil-collection
	evil-want-integration t) ; Same as above
  :requires (undo-fu evil-collection))

;; A collection of keybinds for evil-mode
(use-package evil-collection)

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu)

;; Provide this file to init.el
(provide 'packages)
