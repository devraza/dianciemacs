;;; lisp/editor.el --- Default configration for Dianciemacs' editor -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Emacs' default editing experience sucks a lot.  There's too much most people
;; will never need and I personally believe modal keybinds to be superior.
;; So, there's a lot changes Dianciemacs will be making to the editor, all of which can be seen in this file.
;;
;;; Code:

;; Quit input dialogues after pressing escape once
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Line Wrapping
(global-visual-line-mode 1) ; Prevent wrapping of words

;; yasnippet - A template system for Emacs
(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'org-mode-hook #'yas-minor-mode))
;; yasnippet-snippets - A snippet collection package by AndreaCotti
(use-package yasnippet-snippets
  :after yasnippet)

;; evil - A Vi Layer inside of Emacs
(use-package evil
  :custom
  (evil-want-keybinding nil) ; Make room for evil-collection
  (evil-want-integration t) ; Same as above
  (evil-undo-system 'undo-fu) ; Set the undo/redo system
  (evil-respect-visual-line-mode t) ; Make evil respect line wrapping
  :config
  (evil-mode 1))

;; evil-commentary - Comment stuff out
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

;; evil-surround - You will be surrounded
(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode))

;; evil-snipe - 2-char searching for evil-mode
(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1))

;; evil-collection - A collection of keybinds for evil
(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

;; evil-escape - Escape from insert mode using jk
(use-package evil-escape
  :after evil
  :config
  (setq-default evil-escape-key-sequence "jk")
  :init
  (evil-escape-mode 1))

;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu
  :after evil)

;; Disable the creation of files ending with '~' (backup files)
(setq make-backup-files nil)

;; Move files with '#' to system tmp directory
(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Set theme to `kagayaki', Dianicemacs' default
(use-package autothemer)
(use-package kagayaki-theme
  :straight (:package "kagayaki" :host github
		      :repo "devraza/kagayaki-emacs"))
(load-theme 'kagayaki t)

;; rainbow-mode - Colourful colour codes!
(use-package rainbow-mode)
;; Enable rainbow-mode globally
(with-eval-after-load 'rainbow-mode
  (define-globalized-minor-mode global-rainbow-mode rainbow-mode
    (lambda () (rainbow-mode 1)))
  (global-rainbow-mode 1))

;; general - More convenient key definitions for Emacs
(use-package general
  :after evil
  :config
  (general-evil-setup t)
  :init
  (general-create-definer diancite/leaders
    :prefix leader-key))

(with-eval-after-load 'general
  (diancite/leaders
    :keymaps 'normal
    "f" '(:wk "File")
    "n" '(:wk "Org")
    "m" '(:wk "Magit")
    "w" '(:wk "Evil")
    "p" '(:wk "Projects")))
  
;;; editor.el ends here
