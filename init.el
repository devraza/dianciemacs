;; Disable Emacs window resizing at startup
(setq frame-resize-pixelwise t)

;; Remove the startup screen
(setq inhibit-startup-message t)

;; Disable some GTK decoration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable line numbers globally
(global-display-line-numbers-mode 1)

;; Add the melpa package repository and initialize package repositories
(require 'package)
(package-initialize)

;; Straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package for simplicity, and use straight.el for it by default
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Disable the creation of files ending with '~'
(setq make-backup-files nil)

;; Install the Doom Emacs theme megapack.
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Don't enable package.el at startup
(setq package-enable-at-startup nil)

;; Set theme to doom-tokyo-night, Dianicemacs' default
(load-theme 'doom-tokyo-night t)

;; Vi layer inside of Emacs
;; undo-fu, used by evil for undo/redo functionality
(use-package undo-fu
  :ensure t)

(use-package evil
  :requires undo-fu
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (evil-mode 1))

;; Keep packages up to date
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Modeline - doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25
	doom-modeline-bar-width 0
	doom-modeline-project-detection 'auto
	doom-modeline-buffer-encoding nil
	doom-modeline-modal t
	doom-modeline-modal-icon t
	doom-modeline-buffer-file-name-style 'file-name))

(use-package magit
  :ensure t)

;; Icons for various UI elements
(use-package all-the-icons
  :ensure t)

;; Programming languages configuration
;; Rust
