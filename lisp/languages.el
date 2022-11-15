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

;; Rust
(use-package rustic
  :custom
  (rustic-lsp-client 'eglot)) ; Make eglot the default LSP client

;; Lua
(use-package lua-mode)

;; Autobrackets
(add-hook 'prog-mode-hook 'electric-pair-mode)
