;;; lisp/interface.el --- Changes to Emacs' interface -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Emacs has a little too much going on in it's interface by default - things
;; like GTK dialog boxes for quitting, a scroll bar, a menu bar, etc. are all
;; unnecessary for most users - so disabling that is done right in this file.
;; Additionally, the default theme isn't very aesthetic, so that obviously needs to change too.
;;
;;; Code:

;; Stop Emacs from resizing the window at startup
(setq frame-resize-pixelwise t)

;; Remove the startup screen
(setq inhibit-startup-message t)

;; Disable the GTK dialog that appears when exiting without saving
(setq use-dialog-box nil)

;; Enable line numbers globally
(global-display-line-numbers-mode 1)

;; Add a nice border around Emacs
(modify-all-frames-parameters
 '((right-divider-width . 15)
   (internal-border-width . 15)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

;; Use the `orderless' completion mechanism
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

;; emacs-dashboard - An extensible Emacs dashboard
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-banner-logo-title "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWelcome to Dianciemacs!")
  (dashboard-center-content t)
  (dashboard-startup-banner nil)
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))

;; magit - A beautiful git porcelain for Emacs
(use-package magit)

;; which-key - a popup which displays available keybindings
(use-package which-key)

;; Themes
;; Install the Doom Emacs theme megapack.
(use-package doom-themes)
  
;; kaolin-themes, depends on autothemer
(use-package kaolin-themes
  :requires autothemer)

;; all-the-icons - Icons for various UI elements
(use-package all-the-icons)

;; vertico - An amazing search engine!
(use-package vertico
  :init
  (vertico-mode 1))

(use-package diredfl ; Colourise dired!
  :hook dired-mode)

;;; interface.el ends here
