;;; This file contains the packages that Dianciemacs uses

;; magit - A beautiful git porcelain for Emacs
(use-package magit
  :ensure t)

;;; Themes
;; Install the Doom Emacs theme megapack.
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; kaolin-themes, depends on autothemer
(use-package kaolin-themes
  :requires autothemer
  :ensure t)

(use-package autothemer
  :ensure t)

;; all-the-icons - Icons for various UI elements
(use-package all-the-icons
  :ensure t)

;;; org-mode
;; org-superstar
(use-package org-superstar
  :ensure t)

;;; evil - A Vi layer inside of Emacs
(use-package evil
  :requires undo-fu
  :ensure t)

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu
  :ensure t)

;; Set theme to doom-tokyo-night, Dianicemacs' default
(load-theme 'doom-tokyo-night t)

;; Provide this file to init.el
(provide 'packages)
