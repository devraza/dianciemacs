;;; lisp/languages.el --- Support for programming languages -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Trivial changes done by almost everyone - no editor supports every language by default.
;; You will probably be adding on to the stuff in this file - in the `user/' directory, of course.
;;
;;; Code:

;; This file contains configuration for languages

;; justfile
(use-package just-mode)

;; Markdown
(use-package markdown-mode)

;; Diagnostics
(use-package flycheck-rust
  :after flycheck
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)) ; Enable flycheck-rust where flycheck is enabled. If not a rust file, does nothing.
  
(use-package flycheck-inline
  :after flycheck
  :hook
  (flycheck-mode . flycheck-inline-mode)) ; Enable flycheck-inline where flycheck is enabled

(use-package flycheck
  :hook prog-mode
  :init
  (with-eval-after-load 'flycheck
    (push 'rustic-clippy flycheck-checkers))) ; Use clippy for Rust

;; eglot - Language Server Protocol ingegration
(use-package eglot)

;; Go
(use-package go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)) ; Format on save

;; Rust
(use-package rustic
  :custom
  (rustic-format-trigger 'on-save) ; Format buffer on save
  (rustic-lsp-client 'eglot)) ; Make eglot the default LSP client

;; Disable flymake for eglot - in favour of flycheck
(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;; Lua
(use-package lua-mode)

;; Autobrackets
(add-hook 'prog-mode-hook 'electric-pair-mode)

;;; languages.el ends here
