;;; This file customizes Emacs' editor

;; Quit input dialogues after pressing escape once
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; evil - A Vi Layer inside of Emacs
(use-package evil
  :init
  (setq evil-want-keybinding nil ; Make room for evil-collection
	evil-want-integration t ; Same as above
	evil-undo-system 'undo-fu) ; Set the undo/redo system
  :config
  (evil-mode 1))

;; evil-collection - a collection of keybindings for evil-mode
(use-package evil-collection
  :after evil ; In order to recognize evil-want-... being set
  :init
  (evil-collection-init)) ; Enable the evil-collection keybinds

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu)

;; Disable the creation of files ending with '~' (backup files)
(setq make-backup-files nil)

;;; Themes
;; Customize doom-themes
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(doom-themes-treemacs-config) ; Enable theming of treemacs
(doom-themes-org-config) ; And org-mode

;; Set theme to doom-tokyo-night, Dianicemacs' default
(load-theme 'doom-tokyo-night t)

;;; Keybinds
;; Enable which-key
(which-key-mode)
(setq which-key-idle-delay 0.1) ; Make the popup appear faster
(setq which-key-separator " - " ) ; Change the seperator which-key uses

;; Provide this file to init.el
(provide 'editor)
