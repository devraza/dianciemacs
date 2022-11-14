;; This file contains configuration for languages

;; Markdown
(use-package markdown-mode)

;; Diagnostics
(use-package flymake)

;; eglot - Language Server Protocol ingegration
(use-package eglot)

;; Rust
(use-package rustic
  :custom
  (rustic-lsp-client 'eglot)) ; Make eglot the default LSP client

(add-hook 'prog-mode-hook 'electric-pair-mode)
