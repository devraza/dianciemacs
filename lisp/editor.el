;;; This file customizes Emacs' editor

;; Quit input dialogues after pressing escape once
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Line Wrapping
(global-visual-line-mode 1) ; Prevent wrapping of words

;;; evil - A Vi Layer inside of Emacs
(use-package evil
  :custom
  (evil-want-integration t) ; Same as above
  (evil-undo-system 'undo-fu) ; Set the undo/redo system
  :config
  (evil-mode 1))

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

;; general - More convenient key definitions for Emacs
(use-package general
  :config
  (general-evil-setup t)
  :init
  (general-create-definer diancite/leaders
			  :prefix leader-key))

(diancite/leaders
 :keymaps 'normal
 "f" '(:wk "File")
 "n" '(:wk "Org")
 "m" '(:wk "Magit")
 "w" '(:wk "Evil")
 "p" '(:wk "Projects"))

(set-face-foreground 'vertical-border (face-background 'default))

;; Provide this file to init.el
(provide 'editor)
