;;; This file customizes Emacs' editor

;; evil - A Vi Layer inside of Emacs
(evil-mode 1) ; Enable evil
(setq evil-undo-system 'undo-fu) ; Enable undo/redo functionality using undo-fu

;; Provide this file to init.el
(provide 'editor)
