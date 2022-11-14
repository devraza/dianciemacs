;; This file contains configuration for languages

;; Markdown
(use-package markdown-mode)

;; Diagnostics
(use-package flycheck)

;; eglot - Language Server Protocol ingegration
(use-package eglot)

;; Go
(use-package go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save) ; Format on save
  :hook
  (go-mode . flycheck-mode)) ; Enable flycheck-mode by default

;; Autobrackets
(add-hook 'prog-mode-hook 'electric-pair-mode)
