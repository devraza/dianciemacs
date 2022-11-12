;; This file customizes Emacs' editor

;; Quit input dialogues after pressing escape once
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Line Wrapping
(global-visual-line-mode 1) ; Prevent wrapping of words

;;; evil - A Vi Layer inside of Emacs
(use-package evil
  :custom
  (evil-want-keybinding nil) ; Make room for evil-collection
  (evil-want-integration t) ; Same as above
  (evil-undo-system 'undo-fu) ; Set the undo/redo system
  :config
  (evil-mode 1))

;; evil-collection - A collection of keybinds for evil
(use-package evil-collection
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

;; evil-escape - Escape from insert mode using jk
(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "jk")
  :init
  (evil-escape-mode 1))

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu)

;; Disable the creation of files ending with '~' (backup files)
(setq make-backup-files nil)

;; Move files with '#' to system tmp directory
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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
