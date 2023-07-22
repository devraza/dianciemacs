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
;; (use-package flycheck-rust
;;   :after flycheck
;;   :init
;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)) ; Enable flycheck-rust where flycheck is enabled. If not a rust file, does nothing.
  
;; (use-package flycheck-inline
;;   :after flycheck
;;   :hook
;;   (flycheck-mode . flycheck-inline-mode)) ; Enable flycheck-inline where flycheck is enabled

;; (use-package flycheck
;;   :hook prog-mode
;;   :init
;;   (with-eval-after-load 'flycheck
;;     (push 'rustic-clippy flycheck-checkers))) ; Use clippy for Rust

;; eglot - Language Server Protocol ingegration
(use-package eglot)

;; Go
(use-package go-mode
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)) ; Format on save

;; 4-space wide Go indentation
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

;; Rust
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook
            (lambda () (prettify-symbols-mode))) ; Prettify code automatically
  (add-hook 'rust-mode-hook 'eglot-ensure) ; Enable eglot compatibility
  :custom
  (rust-format-on-save t)) ; Format on save

;; Disable flymake for eglot - in favour of flycheck
;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;; Lua
(use-package lua-mode)

;; Autobrackets
(add-hook 'prog-mode-hook 'electric-pair-mode)

;;; languages.el ends here
