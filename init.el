;;; init.el --- Dianciemacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; This is a minimal and elegant Emacs configuration framework.
;; This project aims to keep/make Emacs fast, aesthetic, and beginner-friendly.
;; Maintained by devraza <devraza@outlook.com>
;;
;;; Code:

;; Increase the threshold - performance
(setq gc-cons-threshold (* 50 1000 1000))

;; Set the font
(add-to-list 'default-frame-alist
             '(font . "Iosevka SS12-11"))
(set-face-attribute 'default nil :family "Iosevka")
(set-face-attribute 'variable-pitch nil :family "Iosevka")

;; Disable Emacs' GTK decorations. Done in this file otherwise done too late.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable the modeline. Done in this file for the same reason above
(setq-default mode-line-format nil)

;; Define the leader-key to use.
(defconst leader-key "SPC")

;; Emacs 30 with straight.el
(setq straight-repository-branch "develop")

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

;; Set theme to `hazakura', Dianicemacs' default
(use-package autothemer)
(use-package hazakura-theme
  :straight (:package "hazakura" :host github
		      :repo "devraza/hazakura-emacs"))
(load-theme 'hazakura t)

;; Load the code of some external files
(load "interface")
(load "editor")
(load "org-mode")
(load "keybinds")
(load "languages")

;; Load user configuration
(add-to-list 'load-path (concat user-emacs-directory
				(convert-standard-filename "user/")))
(load "init")

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d41809cb620c823c37cbc55e99adb7d5a4bf5d7237b81bc8b6cfd64a4a2dd7ed"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
