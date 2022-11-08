;;; This file contains configuration for Emacs interface elements.

;; Stop Emacs from resizing the window at startup
(setq frame-resize-pixelwise t)

;; Remove the startup screen
(setq inhibit-startup-message t)

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

;; Provide this file to init.el
(provide 'interface)
