;; This file contains configuration for languages

;; Markdown
(use-package markdown-mode)

;; Diagnostics
(use-package flycheck
  :init
  (global-flycheck-mode) ; Enable flycheck everywhere by default
  (push 'rustic-clippy flycheck-checkers)) ; Use clippy for Rust

;; eglot - Language Server Protocol ingegration
(use-package eglot)

;; Go
(use-package go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save) ; Format on save
  :hook
  (go-mode . flycheck-mode)) ; Enable flycheck-mode by default

;; Rust
(use-package flycheck-rust
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)) ; Enable flycheck-rust where flycheck is enabled. If not a rust file, does nothing.
  
(use-package flycheck-inline
  :hook
  (flycheck-mode . flycheck-inline-mode)) ; Enable flycheck-inline where flycheck is enabled

(use-package rustic
  :custom
  (rustic-lsp-client 'eglot)) ; Make eglot the default LSP client

;; Disable flymake for eglot - in favour of flycheck
(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;; Lua
(use-package lua-mode)

;; Autobrackets
(add-hook 'prog-mode-hook 'electric-pair-mode)
