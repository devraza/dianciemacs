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

;; A nice border around Emacs
(modify-all-frames-parameters
 '((right-divider-width . 15)
   (internal-border-width . 15)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

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

;; A beautiful git porcelain inside of Emacs
(use-package magit
  :ensure t)

;; Icons for various UI elements
(use-package all-the-icons
  :ensure t)

;; Org Mode
(use-package org-superstar
  :ensure t
  :init (add-hook 'org-mode-hook (lambda() (org-superstar-mode 1)))
  :config
  (setq org-superstar-headline-bullets-list
	'("🞉" "🞈" "🞇" "🞆" "🞅" "🞄"))
  (set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.15)
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.35)
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.65)
  (set-face-attribute 'org-document-title nil
                      :height 1.85
                      :foreground 'unspecified
                      :inherit 'org-level-8))

;; Customize Org mode
(setq org-ellipsis "..."
      org-use-property-inheritance t
      org-list-allow-alphabetical t
      org-catch-invisible-edits 'smart
      org-startup-indented t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300)
      org-pretty-entities t
      org-hide-leading-stars t
      org-adapt-indentation t)

(plist-put org-format-latex-options :scale 1.75)

;; Programming languages configuration
;; Rust
