;;; This file customizes Emacs' editor

;;; evil - A Vi Layer inside of Emacs
(setq evil-undo-system 'undo-fu) ; Enable undo/redo functionality using undo-fu
(evil-collection-init) ; Enable the evil-collection keybinds
(evil-mode 1) ; Enable evil

;;; Themes
;; Customize doom-themes
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(doom-themes-treemacs-config) ; Enable theming of treemacs
(doom-themes-org-config) ; And org-mode

;; Set theme to doom-tokyo-night, Dianicemacs' default
(load-theme 'doom-tokyo-night t)

;; Provide this file to init.el
(provide 'editor)
