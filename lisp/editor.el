;;; This file customizes Emacs' editor

;; Quit input dialogues after pressing escape once
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; evil - A Vi Layer inside of Emacs
(evil-collection-init) ; Enable the evil-collection keybinds
(evil-mode 1) ; Enable evil

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
