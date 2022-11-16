;;; init.el --- Dianciemacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; This is a minimal and elegant Emacs configuration framework.
;; This project aims to keep/make Emacs fast, aesthetic, and beginner-friendly.
;; Maintained by devraza <thedevraza@proton.me>
;;
;;; Code:

;; Disable Emacs' GTK decorations. Done in this file otherwise done too late.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable the modeline. Done in this file for the same reason above
(setq-default mode-line-format nil)

;; Define the leader-key to use.
(defconst leader-key "SPC")

;; Straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)) ;
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

;; Always make sure packages are installed to the system
(setq use-package-always-ensure t)

;; Add external e-lisp files to the load-path
(add-to-list 'load-path (concat user-emacs-directory
        (convert-standard-filename "lisp/")))

;; Load the code of some external files
(load "interface")
(load "editor")
(load "org-mode")
(load "keybinds")
(load "performance")
(load "languages")

;; Load user configuration
(add-to-list 'load-path (concat user-emacs-directory
        (convert-standard-filename "user/")))
(load "init")

;;; init.el ends here
